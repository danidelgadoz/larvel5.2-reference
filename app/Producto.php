<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
    //
    use SoftDeletes;

    protected $table = 'producto';
    public $timestamps = true;
    protected $dates = ['deleted_at'];
    protected $guarded = ['id',"deleted_at","created_at","updated_at"];

    public function ventas(){
    	return $this->belongsToMany('App\Venta', 'venta_detalle');
    	// return $this->belongsToMany('App\Venta', 'venta_detalle', 'producto_id', 'venta_id');
    }

    public function cotizaciones(){
    	return $this->belongsToMany('App\Cotizacion', 'cotizacion_detalle');
    }
}