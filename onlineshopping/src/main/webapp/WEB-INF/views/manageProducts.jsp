<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">

		<c:if test="${not empty message }">
			<div class="col-12">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					"${message}"
				</div>
			</div>

		</c:if>
		<div class="col-md-8 offset-md-2 ">
			<div class="card card-primary">
				<div class="card-header">
					<h4>Product Management</h4>
				</div>
				<div class="card-block mt-4 p-4">
					<!-- FORM ELEMENTS -->
					<sf:form modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST">
						<div class="form-group row">
							<label class="control-label col-md-4" for="name">Enter
								Product Name :</label>
							<div class="form-group col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-4" for="brand">Enter
								Brand Name :</label>
							<div class="form-group col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Brand Name" class="form-control" />
									<sf:errors path="brand" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-4" for="description">Product
								Description :</label>
							<div class="form-group col-md-8">
								<sf:textarea class="form-control" id="description"
									path="description" rows="2"></sf:textarea>
									<sf:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-4" for="unitPrice">Enter
								UnitPrice :</label>
							<div class="form-group col-md-8">
								<sf:input type="text" path="unitPrice" id="unitPrice"
									placeholder="Unit Price In &#8377;" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-4" for="quantity">Quantity
								Available :</label>
							<div class="form-group col-md-8">
								<sf:input type="text" path="quantity" id="quantity"
									placeholder="Quantity Available" class="form-control" />
									Available!</em> -->
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-4" for="category">Select
								Category :</label>
							<div class="form-group col-md-8">
								<sf:select path="categoryId" id="category"
									class="form-control col" items="${categories}" itemLabel="name"
									itemValue="id" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-8 offset-md-4">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary" />

								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />

							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>