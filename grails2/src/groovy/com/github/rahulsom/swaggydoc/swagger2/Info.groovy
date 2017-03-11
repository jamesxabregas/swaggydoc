package com.github.rahulsom.swaggydoc.swagger2

import groovy.transform.CompileStatic

/**
 * The object provides metadata about the API. The metadata can be used by the clients if needed, and can be presented in the Swagger-UI for convenience.
 */
@CompileStatic
class Info {
    String title
    String description
    Contact contact
    License license
    String version
    String termsOfServiceUrl

    Info(def contact, def description, def license, def termsOfServiceUrl, def title) {
        this.contact = new Contact(contact)
        this.description = ifString description
        this.license  = new License(license)
        this.termsOfServiceUrl = ifString termsOfServiceUrl
        this.title = ifString title
    }

    static ifString(def input) {
        input instanceof String ? input : null
    }

}
