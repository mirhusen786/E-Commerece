<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    //
    public function index()
    {
        $result['orders']=DB::table('orders')
->select('orders.*','orders_status.orders_status')
->leftJoin('orders_status','orders_status.id','=','orders.order_status')
->get();
        return view('Admin.Report.report',$result);
    }
}
