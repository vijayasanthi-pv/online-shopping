<div class="container">

	<!-- BreadCrumb -->
	<div class="row">

		<div class="col">

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${contextRoot}/show/all/products">Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>
			</ol>

		</div>

	</div>

	<div class="row">

		<!-- Display the product image -->
		<div class="col col-sm-4">

			<div class="img-thumbnail" style="height: 100%">
				<img src="${images}/${product.code}.jpg" class="img img-fluid"
					style="width: 100%; height: 100%"></img>
			</div>

		</div>

		<!-- Display the product description -->
		<div class="col col-sm-8">
			<h3>${product.name}</h3>
			<hr />

			<p>${product.description}</p>
			<hr />

			<h4>
				Price : <strong> &#8377; ${product.unitPrice} /-</strong>
			</h4>
			<hr />

			<c:choose>
				<c:when test="${product.quantity < 1}">
					<h6>
						Qty. Available: <span style="color:red">Out Of Stock!</span>
					</h6>
					<a href="javascript:void(0)" class="btn btn-success disabled"><strike><span
							class="fa fa-cart-plus"></span>Add to Cart</strike></a>
				</c:when>
				<c:otherwise>
					<h6>Qty. Available: ${product.quantity}</h6>
					<a href="${contextRoot}/cart/add/${product.id}/product"
						class="btn btn-success"> <span class="fa fa-cart-plus"></span>Add
						to Cart
					</a>
				</c:otherwise>
			</c:choose>


			<a href="${contextRoot}/show/all/products" class="btn btn-primary">Back
			</a>
		</div>
	</div>

</div>