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
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">
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
							</div>
						</div>
						<!-- File element for image upload -->
						<div class="form-group row">
							<label class="control-label col-md-4" for="file">Select an Image :</label>
							<div class="form-group col-md-8">
								<sf:input type="file" path="file" id="file"
									 class="form-control" />
									 <sf:errors path="file" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-4" for="category">Select
								Category :</label>
							<div class="form-group col-md-8">
								<sf:select path="categoryId" id="category"
									class="form-control col" items="${categories}" itemLabel="name"
									itemValue="id" />
							
							<c:if test="${product.id == 0}">
							<div class="text-right">
								<br/>
								<button type="button" data-toggle="modal" data-target="#myCategoryModal" class="btn btn-warning btn-xs">Add Category</button>
							</div>
							</c:if>
							
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
<div class="row">
	<div class="col-12">
		<h3>Available Products</h3>
		<hr/>
	</div>
	<div class="col-12">
		<div style="overflow:auto">
			<!-- Products table for Admin -->
			<table id="adminProductsTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>Id</th>
						<th>&#160;</th>
						<th>Name</th>
						<th>Brand</th>
						<th>Qty. Avail</th>
						<th>Unit Price</th>
						<th>Activate</th>				
						<th>Edit</th>
					</tr>					
				</thead>
				
				
				<tfoot>
					<tr>					
						<th>Id</th>
						<th>&#160;</th>
						<th>Name</th>
						<th>Brand</th>
						<th>Qty. Avail</th>
						<th>Unit Price</th>
						<th>Activate</th>				
						<th>Edit</th>
					</tr>									
				</tfoot>
				
							
			</table>
		
		</div>
	</div>
</div>

	<div class="modal fade" id="myCategoryModal" role="dialog" tab-index="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add New Category</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Category Form -->
					<sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category"
										method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4">Category Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="category_name" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="category_description" class="control-label col-md-4">Category Description</label>
							<div class="col-md-8">
								<sf:textarea cols="" rows="5" path="description" id="category_description" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" value="Add Category" class="btn btn-primary"/>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

</div>