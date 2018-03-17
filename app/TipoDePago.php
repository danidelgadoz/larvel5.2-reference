<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoDePago extends Model
{
    //

    protected $table = 'tipo_de_pago';
    public $timestamps = false;    

    public function ventas()
    {
    	return $this->hasMany('App\Venta', 'tipo_pago_id');
    }
}
