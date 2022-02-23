@extends('Admin.layout')
@section('page_title','Order')
@section('Orde_select','active')
@section('container')

<!-- display msg -->

@if(session()->has('message'))
<div class="sufee-alert alert with-close alert-warning alert-dismissible fade show">
											<span class="badge badge-pill badge-warning">Success</span>
                                            {{session('message')}}
											<button type="button" class="close" data-dismiss="alert" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
@endif


     <h1 class="mb10">Product</h1>
     <a href="product/manage_product">
     <button type="button" class="btn btn-success">Add Product

     </button>
    </a>
    
     <div class="row m-t-30">
                            <div class="col-md-12">
                                <!-- DATA TABLE-->
                            
                              

                                <div class="table-responsive m-b-40">
                                    <table class="table table-borderless table-data3">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Product Name</th>
                                                <th>Product Image</th>
                                                <th>Product slock</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                       
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>

@endsection