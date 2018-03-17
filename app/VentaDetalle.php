<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VentaDetalle extends Model
{
    protected $table = "venta_detalle";
    public $timestamps = true;    

    /*public function venta()
    {
    	return $this->belongsto('App\Venta', 'venta_id', 'id');
    }*/
}
