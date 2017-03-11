package com.github.rahulsom.swaggydoc.swagger2

/**
 * This is the root document object for the API specification.
 * It combines what previously was the Resource Listing and API Declaration (version 1.2 and earlier) together into one document.
 */
//@Immutable(knownImmutableClasses = [Info])
class SwaggerDocument {
    String swagger
    Info info
    String host
    String basePath
    String[] schemes
    String[] consumes
    String[] produces
    Path[] paths
    Definition[] definitions
    Parameter[] parameters
    Response[] responses
    SecurityDefintion[] securityDefinitions
    Security[] security
    Tag[] tags
    ExternalDoc externalDocs

    SwaggerDocument(Info info, Path[] paths, String swaggerVersion = "2.0") {
        this.info = info
        this.paths = paths
        this.swagger = swaggerVersion
    }
}
