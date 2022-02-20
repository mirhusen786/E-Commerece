<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Admin\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Storage;

class CategoryController extends Controller
{
   
    public function index()
    {
        $cat['data']=Category::all();
       return view('Admin/Category/Category',$cat);
    }

    public function  manage_category(Request $request,$id='')
    {
        if($id>0)
        {
            $arr=Category::where(['id'=>$id])->get();
            
            $result['category_name']=$arr['0']->category_name;
            $result['category_slug']=$arr['0']->category_slug;
            $result['parent_category_id']=$arr['0']->parent_category_id;
            $result['category_image']=$arr['0']->category_image;
            $result['is_home']=$arr['0']->is_home;
            $result['is_home_selected']="";
            if($arr['0']->is_home==1)
            {
            $result['is_home_selected']="checked";
            }
            $result['id']=$arr['0']->id;
        }
        else
        {
            $result['category_name']='';
            $result['category_slug']='';
            $result['parent_category_id']='';
            $result['category_image']='';
            $result['is_home']='';
            $result['is_home_selected']="";
            $result['id']='0';
        }

        $result['category']=DB::table('categories')->where(['status'=>1])->get();
        return view('Admin/Category/manage_category',$result);   
    }

   
    public function manage_category_process(Request $request)
    {
   

     $request->validate([
         'category_name'=>'required',
         'category_slug'=>'required|unique:categories,category_slug,'.$request->post('id'),
        'category_image'=>'mimes:jpg,jpeg,png',
           
      
     ]);
 
     if($request->post('id')>0)
     {
     $cat=Category::find($request->post('id'));
     $msg="Category is Successfully updated";
     }
     else

     {
         $cat=new Category();
         $msg="Category is Successfully Inserted";
     }
     if($request->hasfile('category_image')){

          if($request->post('id')>0)
                   {
                       $arrImage=DB::table('categories')->where(['id'=>$request->post('id')])->get();
                  if(Storage::exists('/public/media/category/'.$arrImage[0]->category_image)){

                    Storage::delete('/public/media/category/'.$arrImage[0]->category_image); 
                }
              }
        $image=$request->file('category_image');
        $ext=$image->extension();
        $image_name=time().'.'.$ext;
        $image->storeAs('/public/media/category',$image_name);
        $cat->category_image=$image_name;
    }
     $cat->category_name=$request->post('category_name');
     $cat->category_slug=$request->post('category_slug');
     $cat->parent_category_id=$request->post('parent_category_id');
     $cat->is_home=0;
     if($request->post('is_home')!==null)
     {
        $cat->is_home=1;
     }
    
     $cat->status=1;
     $cat->save();
     $request->session()->flash('message',$msg);
     return redirect('admin/category');
    }

    
    public function delete(Request $request,$id)
    {
        $data=Category::find($id);
        $data->delete();
        $request->session()->flash('message','Category is successfully deleted'); 
        return redirect('admin/category');
    }

    public function status(Request $request,$status,$id)
    {
        $data=Category::find($id);
        $data->status=$status;
        $data->save();
        $request->session()->flash('message','Category Status is successfully Updated'); 
        return redirect('admin/category');

       
    }

   
}
