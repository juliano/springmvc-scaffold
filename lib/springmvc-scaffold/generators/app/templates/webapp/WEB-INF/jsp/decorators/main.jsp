<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title><sitemesh:write property='title'/></title>
  <sitemesh:write property='head'/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/application.css"/>
</head>

<body>
  <sitemesh:write property='body'/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/javascripts/application.js"></script>
</body>
</html>
