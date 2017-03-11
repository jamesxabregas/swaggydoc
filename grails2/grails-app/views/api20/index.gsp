<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Swagger UI</title>
    <link href='//fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>

    <asset:stylesheet href="swagger/typography.css" media='screen'/>
    <asset:stylesheet href="swagger/reset.css" media='screen'/>
    <asset:stylesheet href="swagger/screen.css" media='screen'/>
    <asset:stylesheet href="swagger/reset.css" media='print'/>
    <asset:stylesheet href="swagger/print.css" media='print'/>

    <asset:javascript src="swagger/swagger-lib/object-assign-pollyfill.js" />
    <asset:javascript src="swagger/swagger-lib/jquery-1.8.0.min.js" />
    <asset:javascript src="swagger/swagger-lib/jquery.slideto.min.js" />
    <asset:javascript src="swagger/swagger-lib/jquery.wiggle.min.js" />
    <asset:javascript src="swagger/swagger-lib/jquery.ba-bbq.min.js" />
    <asset:javascript src="swagger/swagger-lib/handlebars-4.0.5.js" />
    <asset:javascript src="swagger/swagger-lib/lodash.min.js" />
    <asset:javascript src="swagger/swagger-lib/backbone-min.js" />
    <asset:javascript src="swagger/swagger-ui.js" />
    <asset:javascript src="swagger/swagger-lib/highlight.9.1.0.pack.js" />
    <asset:javascript src="swagger/swagger-lib/highlight.9.1.0.pack_extended.js" />
    <asset:javascript src="swagger/swagger-lib/jsoneditor.min.js" />
    <asset:javascript src="swagger/swagger-lib/marked.js" />
    <asset:javascript src="swagger/swagger-lib/swagger-oauth.js" />

    <script type="text/javascript">
        $(function () {
            var url = window.location.search.match(/url=([^&]+)/);
            if (url && url.length > 1) {
                url = decodeURIComponent(url[1]);
            } else {
                url = "${g.createLink(controller: 'api20', action: 'resources')}";
            }

            hljs.configure({
                highlightSizeThreshold: 5000
            });

            // Pre load translate...
            if(window.SwaggerTranslator) {
                window.SwaggerTranslator.translate();
            }
            window.swaggerUi = new SwaggerUi({
                url: url,
                dom_id: "swagger-ui-container",
                supportedSubmitMethods: ['get', 'post', 'put', 'delete', 'patch'],
                onComplete: function(swaggerApi, swaggerUi){
                    if(typeof initOAuth == "function") {
                        initOAuth({
                            clientId: "your-client-id",
                            clientSecret: "your-client-secret-if-required",
                            realm: "your-realms",
                            appName: "your-app-name",
                            scopeSeparator: " ",
                            additionalQueryStringParams: {}
                        });
                    }

                    if(window.SwaggerTranslator) {
                        window.SwaggerTranslator.translate();
                    }
                },
                onFailure: function(data) {
                    log("Unable to Load SwaggerUI");
                },
                docExpansion: "none",
                jsonEditor: false,
                defaultModelRendering: 'schema',
                showRequestHeaders: false
            });

            window.swaggerUi.load();

            function log() {
                if ('console' in window) {
                    console.log.apply(console, arguments);
                }
            }
        });
    </script>
</head>

<body class="swagger-section">
<div id='header'>
    <div class="swagger-ui-wrap">
        <a id="logo" href="${g.createLink(controller: 'api20')}"><asset:image class="logo__img" alt="swagger" height="30" width="30" src="images/logo_small.png" /><span class="logo__title">swagger</span></a>
        <form id='api_selector'>
            <div class='input'><input placeholder="${g.createLink(controller: 'api20', action: 'resources')}" id="input_baseUrl" name="baseUrl" type="text"/></div>
            <div id='auth_container'></div>
            <div class='input'><a id="explore" class="header__btn" href="#" data-sw-translate>Explore</a></div>
        </form>
    </div>
</div>

<div id="message-bar" class="swagger-ui-wrap" data-sw-translate>&nbsp;</div>
<div id="swagger-ui-container" class="swagger-ui-wrap"></div>
</body>
</html>
