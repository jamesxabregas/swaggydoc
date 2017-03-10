package com.github.rahulsom.swaggydoc

import grails.converters.JSON
import groovy.json.JsonSlurper

import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletResponse

class ApiController {

    def swaggyDataService

    def index() { /* Render GSP as HTML */ }

    /**
     * Renders the Swagger Resources.
     * @return
     */
    def resources() {
        log.info "Presenting resource listing"
        render swaggyDataService.resources() as JSON
    }


    def show(String id) {
        header 'Access-Control-Allow-Origin', '*'
        log.info "Presenting definition for $id"
        ControllerDefinition controllerDefinition = swaggyDataService.apiDetails(id)
        if (!controllerDefinition) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND)
        } else {
            def newJson = removeUnderscores(
                    new JsonSlurper().parseText(
                            (controllerDefinition as JSON).toString()
                    ) as Map
            )

            newJson.apis.each { api ->
                api.operations.each { op ->
                    op.responseMessages.each { rm ->
                        if (rm.responseModel == 'void') {
                            rm.remove('responseModel')
                        }
                    }
                }
            }

            //// START hacky workaround to remove null attributes
            newJson = sanitizeNulls(newJson)
            //// END hacky workaround

            render newJson as JSON
        }
    }

    private Map removeUnderscores(Map<String, Object> map) {
        map.collectEntries { String k, Object v ->
            def k1 = k == '_enum' ? 'enum' : k
            def v1
            if (v instanceof Map) {
                v1 = removeUnderscores(v)
            } else if (v instanceof List) {
                v1 = v.collect { v2 ->
                    v2 instanceof Map ? removeUnderscores(v2) : v2
                }
            } else {
                v1 = v
            }
            [k1, v1]
        }.findAll { String k, Object v ->
            k != 'enum' || k == 'enum' && v instanceof List && v.size() > 0
        }
    }

    //A dodgy hack
    //Newer versions of Swagger and Swagger-UI don't accept attributes set to null in the model
    private sanitizeNulls(def object) {
        if (object instanceof Map<String, Object>) {
            def newObject = [:]

            object.each { key, value ->

                if (value != null) {
                    newObject[key] = sanitizeNulls(value)
                }
            }
            return newObject

        } else if (object instanceof List || object.getClass().isArray()) {
            def newArray = []

            object.each { it ->
                newArray += sanitizeNulls(it)
            }

            return newArray

        } else if (object != null) {
            return object
        }

        return null
    }

}
