<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="field">
	Name:<br />
	<form:input path="name" />
	<form:errors path="name" />
</div>

<div class="field">
	Active:<br />
	<form:checkbox path="active" />
	<form:errors path="active" />
</div>

<div class="field">
	Price:<br />
	<form:input path="price" />
	<form:errors path="price" />
</div>

<div class="field">
	Category:<br />
	<form:input path="category" />
	<form:errors path="category" />
</div>

<div class="actions">
	<button type="submit">send</button>
</div>
