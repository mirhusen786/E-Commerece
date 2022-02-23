@extends('Admin.layout')
@section('page_title','Order')
@section('Orde_select','active')
@section('container')

<!-- display msg -->
<h1 class="mb10">Order</h1>
     <div class="row m-t-30">
                            <div class="col-md-12">
                                <!-- DATA TABLE-->
                            
                              

                                <div class="table-responsive m-b-40">
                                    <table class="table table-borderless table-data3">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Customer Details</th>
                                                <th>Amount</th>
                                                <th>Order Status</th>
                                                <th>Payment Status</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                       @foreach($orders as $list)
                                       <tr>
                                           <td><a href="{{url('admin/order_detail')}}/{{{$list->id}}}">{{$list->id}}</a></td>
                                           <td>{{$list->added_on}}</td>
                                           <td>{{$list->name}}<br>
                                            {{$list->email}}<br>
                                            {{$list->address}}<br>
                                            {{$list->mobile}}<br>
                                           
                                        
                                        </td>
                                           <td>{{$list->total_amt}}</td>
                                           <td>{{$list->order_status}}</td>
                                           <td>{{$list->payment_status}}</td>
                                           <td>{{$list->total_amt}}</td>
                                       </tr>
                                       @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>

@endsection