<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cotizacion extends Model
{
    //
    protected $table = 'cotizacion';
    public $timestamps = true;
    protected $with = ['cliente', 'tipo_de_pago', 'productos'];

    public function cliente()
    {
        return $this->belongsto('App\Cliente', 'cliente_id', 'id');
    }

    public function tipo_de_pago()
    {
        return $this->belongsto('App\TipoDePago', 'tipo_de_pago_id', 'id');
    }

    public function productos(){
        return $this->belongsToMany('App\Producto', 'cotizacion_detalle')->withPivot(
            'descripcion',
            'cantidad',
            'precio_unitario',
            'total'
        );
    }
}
