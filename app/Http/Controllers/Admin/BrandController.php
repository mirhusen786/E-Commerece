<?php


namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Brand;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Storage;

class BrandController extends Controller
{
    public function index()
    {
        $cat['data']=Brand::all();
       return view('Admin/Brand/Brand',$cat);
    }


    public function  manage_brand(Request $request,$id='')
    {
        if($id>0)
        {
            $arr=Brand::where(['id'=>$id])->get();
            
            $result['name']=$arr['0']->name;
            $result['image']=$arr['0']->image;
            $result['is_home']=$arr['0']->is_home;
            $result['is_home_selected']="";
            if($arr['0']->is_home==1)
            {
            $result['is_home_selected']="checked";
            }
            $result['status']=$arr['0']->status;
          
            $result['id']=$arr['0']->id;
        }
        else
        {
            $result['name']='';
            $result['image']='';
            $result['is_home']='';
            $result['is_home_selected']="";
            $result['status']='';
            $result['id']='0';
        }
      
        return view('Admin/Brand/manage_brand',$result);   
    }

   
    public function manage_brand_process(Request $request)
    {
        $request->validate([
            'name'=>'required|unique:brands,name,'.$request->post('id'), 
            'image'=>'mimes:jpg,jpeg,png',
        ]);

        if($request->post('id')>0){
            $model=Brand::find($request->post('id'));
            $msg="Brand is Successfully updated";
        }else{
            $model=new Brand();
            $msg="Brand is Successfully inserted";
        }

        if($request->hasfile('image')){

            if($request->post('id')>0)
            {
                $arrImage=DB::table('brands')->where(['id'=>$request->post('id')])->get();
           if(Storage::exists('/public/media/brand/'.$arrImage[0]->image)){

             Storage::delete('/public/media/brand/'.$arrImage[0]->image); 
         }
       }

            $image=$request->file('image');
            $ext=$image->extension();
            $image_name=time().'.'.$ext;
            $image->storeAs('/public/media/brand',$image_name);
            $model->image=$image_name;
        }
        
        $model->name=$request->post('name');
        $model->is_home=0;
        if($request->post('is_home')!==null)
        {
           $model->is_home=1;
        }
        $model->status=1;
        $model->save();
        $request->session()->flash('message',$msg);
        return redirect('admin/brand');
        
    }

    
    public function delete(Request $request,$id)
    {
        $data=Brand::find($id);
        $data->delete();
        $request->session()->flash('message','Product Brand is successfully deleted'); 
        return redirect('admin/brand');
    }

    public function status(Request $request,$status,$id)
    {
        $data=Brand::find($id);
        $data->status=$status;
        $data->save();
        $request->session()->flash('message','Product Brand is successfully updated'); 
        return redirect('admin/brand');
    }

}
