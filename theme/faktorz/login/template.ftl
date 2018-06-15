<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <!-- fontawesome -->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

    <!-- Roboto font -->
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.png" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
    <div id="kc-container" class="${properties.kcContainerClass!}">
        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">
            <div id="kc-header" class="${properties.kcHeaderClass!}">
              <div class="container">
                <nav class="navbar navbar-expand-lg px-md-0">
                	<a class="navbar-brand" style="width:200px" href="${properties.kcLogoLink!}">
                		<span class="logo-default">
                			<img src="${url.resourcesPath}/img/dark_logo_transparent.svg" alt="Faktorz Logo">
                		</span>
                	</a>
                	<div class="collapse navbar-collapse" id="navbarNav"></div>
                </nav>
              </div>
            </div>
            <#if realm.internationalizationEnabled>
                <div id="kc-locale" class="${properties.kcLocaleClass!}">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div class="kc-dropdown" id="kc-locale-dropdown">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul>
                                <#list locale.supported as l>
                                    <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>
            <section>
              <div id="kc-content" class="${properties.kcContentClass!}">
                <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                      <h2 class="form-signin-heading">Please login</h2>
                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                            <#nested "form">
                        </div>
                        <#if displayMessage && message?has_content>
                            <div class="${properties.kcFeedbackAreaClass!}">
                              <#if message.type = 'success'>
                                <div class="alert alert-success">
                                  <span class="${properties.kcFeedbackSuccessIcon}"></span>
                              </#if>
                              <#if message.type = 'warning'>
                                <div class="alert alert-warning">
                                  <span class="${properties.kcFeedbackWarningIcon}"></span>
                              </#if>
                              <#if message.type = 'error'>
                                <div class="alert alert-danger">
                                  <span class="${properties.kcFeedbackErrorIcon}"></span>
                              </#if>
                              <#if message.type = 'info'>
                                <div class="alert alert-info">
                                  <span class="${properties.kcFeedbackInfoIcon}"></span>
                              </#if>
                                  <span class="kc-feedback-text">${message.summary}</span>
                                </div>
                            </div>
                        </#if>
                    </div>
                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
              </div>
            </section>
        </div>
    </div>
</body>
</html>
</#macro>
