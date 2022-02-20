<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Color;
use Illuminate\Http\Request;

class ColorController extends Controller
{
    public function index()
    {
        $cat['data']=Color::all();
       return view('Admin/Color/Color',$cat);
    }

    public function  manage_color(Request $request,$id='')
    {
        if($id>0)
        {
            $arr=Color::where(['id'=>$id])->get();
            
            $result['color']=$arr['0']->color;
           
            $result['id']=$arr['0']->id;
        }
        else
        {
            $result['color']='';
          
            $result['id']='0';
        }
      
        return view('Admin/Color/manage_color',$result);   
    }

   
    public function manage_color_process(Request $request)
    {
   

     $request->validate([
        //  'name'=>'required',
         'color'=>'required|unique:colors,color,'.$request->post('id'),
     ]);
 
     if($request->post('id')>0)
     {
     $cat=Color::find($request->post('id'));
     $msg="Color is Successfully updated";
     }
     else
     {
         $cat=new Color();
         $msg="Color is Successfully Inserted";
     }

     $cat->color=$request->post('color');
    
     $cat->status=1;
     $cat->save();
     $request->session()->flash('message',$msg);
     return redirect('admin/color');
    }

    
    public function delete(Request $request,$id)
    {
        $data=Color::find($id);
        $data->delete();
        $request->session()->flash('message','Color is successfully deleted'); 
        return redirect('admin/color');
    }

    public function status(Request $request,$status,$id)
    {
        $data=Color::find($id);
        $data->status=$status;
        $data->save();
        $request->session()->flash('message','Color Status is successfully Updated'); 
        return redirect('admin/color');

       
    }

}
