<div class="field">
	Name:<br />
	<form:input path="name" />
	<form:errors path="name" />
</div>

<div class="field">
	Active:<br />
	<form:checkbox path="active" />
</div>

<div class="field">
	Price:<br />
	<form:input path="price" />
	<form:errors path="price" />
</div>

<div class="field">
	Category:<br />
	<form:select path="category.id">
		<form:options items="${categoryList}" itemValue="id" itemLabel="id"/>
	</form:select>
</div>

