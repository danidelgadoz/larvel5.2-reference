<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    //
    protected $table = "venta";
    public $timestamps = true;
    protected $with = ['cliente', 'tipo_de_pago', 'productos'];
    protected $fillable = [
    	'fecha_envio',
	    'abono',
	    'orden_compra',
	    'estado_pago',
	    'estado',
	    'observaciones',
	    'cotizacion'
    ];

    public function cliente()
    {
    	return $this->belongsto('App\Cliente', 'cliente_id', 'id');
    }

    public function tipo_de_pago()
    {
    	return $this->belongsto('App\TipoDePago', 'tipo_de_pago_id', 'id');
    }    

    public function productos(){
    	return $this->belongsToMany('App\Producto', 'venta_detalle')->withPivot(
    		'descripcion',
    		'cantidad',
    		'precio_unitario',
    		'total'
    	);
    }

    /*public function venta_detalles(){
    	return $this->hasMany('App\VentaDetalle', 'venta_id', 'id');
    }*/

}
