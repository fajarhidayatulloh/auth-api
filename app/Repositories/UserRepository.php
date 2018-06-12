<?php  

/**
 * author : Fajar Hidayatulloh
 */
namespace App\Repositories;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Repositories\Contracts\UserRepository as Contracts;
use App\Models\Users;
use DB;

class UserRepository implements Contracts{
	

	/**
     * [setRegistration description]
     * @param [type] $request [description]
     */
	public function setRegistration($request) 
	{
		
		$model = new Users;
		$model->name = $request->name;
		$model->email = $request->email;
		$model->password = Hash::make($request->password);
		$model->created_at = \Carbon\Carbon::now();
		$model->save();
        
	}

    /**
     * [setUserList description]
     */
    public function setUserList()
    {
        $model = Users::select('*')->get();
        return $model;
    }

    /**
     * [setUserUpdate description]
     * @param [type] $request [description]
     * @param [type] $id      [description]
     */
    public function setUserUpdate($request,$id)
    {
    	
    	$model = Users::find($id);
		$model->name = $request->name;
		$model->email = $request->email;
		$model->password = Hash::make($request->password);
		$model->updated_at = \Carbon\Carbon::now();
		$model->update();

		return $model;
    }

    /**
     * [setUserDelete description]
     * @param [type] $request [description]
     * @param [type] $id      [description]
     */
    public function setUserDelete($request, $id)
    {
    	$model = Users::find($id);
    	$model->delete();
    	return $model;	
    }

}

?>