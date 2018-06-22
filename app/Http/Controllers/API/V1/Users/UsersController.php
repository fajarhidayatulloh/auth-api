<?php  

/**
 * author : Fajar Hidayatulloh
 */
namespace App\Http\Controllers\API\V1\Users;

use App\Http\Controllers\Controller;
use App\Repositories\UserRepository;
use Illuminate\Http\Request;

class UsersController extends Controller {

	protected $userRepository;

	/**
	 * [__construct description]
	 * @param UserRepository $userRepository [description]
	 */
	public function __construct(UserRepository $userRepository){
		$this->userRepository = $userRepository;
	}

	/**
	 * [getRegistration description]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function getRegistration(Request $request) 
	{
		
		try {
			$this->userRepository->setRegistration($request);
			return response()->json([
				'success' => true,
				'status_code' => 200,
				'message' => 'Registration successfully.'
			], 200);
		} catch(\Exception $e) {
			return response()->json([
				'success' => false,
				'status_code' => 422,
				'message' => 'Registration failed.',
				'error_log' => $e
			], 422);
		}
	}

	/**
	 * [getUserList description]
	 * @return [type] [description]
	 */
	public function getUserList()
	{
		try {
			$data = $this->userRepository->setUserList();
			return response()->json([
				'success' => true,
				'status_code' => 200,
				'data' => $data
			], 200);
		} catch(\Exception $e) {
			return response()->json([
				'success' => false,
				'status_code' => 422,
				'message' => 'Load data failed.',
				'error_log' => $e
			], 422);
		}
	}

	/**
	 * [getUserUpdate description]
	 * @param  Request $request [description]
	 * @param  [type]  $id      [description]
	 * @return [type]           [description]
	 */
	public function getUserUpdate(Request $request,$id) 
	{
		
		try {
			$this->userRepository->setUserUpdate($request, $id);
			return response()->json([
				'success' => true,
				'status_code' => 200,
				'message' => 'Update successfully.'
			], 200);
		} catch(\Exception $e) {
			return response()->json([
				'success' => false,
				'status_code' => 422,
				'message' => 'Update failed.',
				'error_log' => $e
			], 422);
		}
	}

	/**
	 * [getUserDelete description]
	 * @param  Request $request [description]
	 * @param  [type]  $id      [description]
	 * @return [type]           [description]
	 */
	public function getUserDelete(Request $request,$id) 
	{
		
		try {
			$this->userRepository->setUserDelete($request, $id);
			return response()->json([
				'success' => true,
				'status_code' => 200,
				'message' => 'Delete successfully.'
			], 200);
		} catch(\Exception $e) {
			return response()->json([
				'success' => false,
				'status_code' => 422,
				'message' => 'Delete failed.',
				'error_log' => $e
			], 422);
		}
	}
}

?>