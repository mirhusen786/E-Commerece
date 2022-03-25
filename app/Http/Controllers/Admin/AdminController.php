<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
   
    public function index(Request $request)
    {
      if($request->session()->has('ADMIN_LOGIN')){
          return redirect('admin/dashboard'); 
      }
      else
      {
       
        return view('admin.login');
      }
        return view('admin.login');
    }

   
    public function auth(Request $request)
    {
      $email=$request->post('email');
      $password=$request->post('password');

      // $result=Admin::where(['email'=>$email,'password'=>$password])->get();
      $result=Admin::where(['email'=>$email])->first();
if($result)
{
  if(Hash::check($request->post('password'),$result->password)){
  $request->session()->put('ADMIN_LOGIN',true);
      $request->session()->put('ADMIN_ID',$result->id);
      return redirect('admin/dashboard');
}
else{
  
  $request->session()->flash('error','please enter valid login details');
  return redirect('admin');}
}else{
  
  $request->session()->flash('error','please enter valid login details');
  return redirect('admin');
}
      // if(isset($result['0']->id)){
      // $request->session()->put('ADMIN_LOGIN',true);
      // $request->session()->put('ADMIN_ID',$result['0']->id);
      // return redirect('admin/dashboard');
      // }
      // else
      // {
      //   $request->session()->flash('error','please enter valid login details');
      //   return redirect('admin');
      // }
    }

    public function dashboard()
    {
       $customers=DB::table('customers')->count('name');
       $acustomers=DB::table('customers')->where('status','1')->count('name');
       $dcustomers=DB::table('customers')->where('status','0')->count('name');
       $total=DB::table('orders')->sum('total_amt');   
       $placed=DB::table('orders')->where('order_status','1')->count('order_status');  
       $otway=DB::table('orders')->where('order_status','2')->count('order_status'); 
       $delevered=DB::table('orders')->where('order_status','3')->count('order_status');
       $successpayment=DB::table('orders')->where('payment_status','Success')->count('payment_status');


       $data=compact('customers','acustomers','dcustomers','total','placed','otway','delevered','successpayment');
        return view('Admin.dashboard')->with($data);
    }
    public function updatepassword()
    {
       $r=Admin::find(1);
       $r->password=Hash::make(12345678);
       $r->save();
    }

}
