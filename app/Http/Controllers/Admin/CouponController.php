<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Coupon;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    public function index()
    {
        $cat['data']=Coupon::all();
       return view('Admin/Coupon/Coupon',$cat);
    }

    public function  manage_coupon(Request $request,$id='')
    {
        if($id>0)
        {
            $arr=Coupon::where(['id'=>$id])->get();
            
            $result['title']=$arr['0']->title;
            $result['code']=$arr['0']->code;
            $result['value']=$arr['0']->value;
            $result['type']=$arr['0']->type;
            $result['min_order_amt']=$arr['0']->min_order_amt;
            $result['is_one_time']=$arr['0']->is_one_time;
            $result['id']=$arr['0']->id;
        }
        else
        {
            $result['title']='';
            $result['code']='';
            $result['value']='';
            $result['type']='';
            $result['min_order_amt']='';
            $result['is_one_time']='';
            $result['id']='0';
        }
      
        return view('Admin/Coupon/manage_coupon',$result);   
    }

   
    public function manage_coupon_process(Request $request)
    {
   

     $request->validate([
         'title'=>'required',
         'code'=>'required|unique:coupons,code,'.$request->post('id'),
         'title'=>'required',
     ]);
 
     if($request->post('id')>0)
     {
     $cat=Coupon::find($request->post('id'));
     $msg="Coupon is Successfully updated";
     }
     else
     {
         $cat=new Coupon();
         $msg="Coupon is Successfully Inserted";
         $cat->status=1;
     }

     $cat->title=$request->post('title');
     $cat->code=$request->post('code');
     $cat->value=$request->post('value');
     $cat->type=$request->post('type');
     $cat->min_order_amt=$request->post('min_order_amt');
     $cat->is_one_time=$request->post('is_one_time');
     $cat->status=1;
     $cat->save();
     $request->session()->flash('message',$msg);
     return redirect('admin/coupon');
    }

    
    public function delete(Request $request,$id)
    {
        $data=Coupon::find($id);
        $data->delete();
        $request->session()->flash('message','Coupon is successfully deleted'); 
        return redirect('admin/coupon');
    }

    public function status(Request $request,$status,$id)
    {
        $data=Coupon::find($id);
        $data->status=$status;
        $data->save();
        $request->session()->flash('message','Coupon is successfully updated'); 
        return redirect('admin/coupon');
    }

   
}
