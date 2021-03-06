<?php  

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    
    protected $table = 'users';
	protected $primaryKey = 'id';
	public $timestamps = false;
	protected $fillable=['id','name','email','password','created_at','updated_at'];
	protected $hidden = ['password', 'remember_token'];
}
