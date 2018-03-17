<?php

namespace App\Http\Controllers;

use App\Cotizacion;
use App\CotizacionDetalle;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CotizacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cotizaciones = Cotizacion::all();
        return response()->json($cotizaciones);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
            DB::beginTransaction();

            $cotizacion = new Cotizacion();
            $cotizacion->codigo = time(); //$request->codigo;
            $cotizacion->estado = 'PENDIENTE';
            $cotizacion->fecha_emision = date("Y-m-d H:i:s");
            $cotizacion->fecha_validez = $request->fecha_validez;
            $cotizacion->moneda = $request->moneda;
            $cotizacion->plazo_entrega = $request->plazo_entrega;
            $cotizacion->garantia = $request->garantia;
            $cotizacion->mensaje = $request->mensaje;
            $cotizacion->orden_compra = $request->orden_compra;
            $cotizacion->observaciones = $request->observaciones;
            $cotizacion->contacto = $request->contacto;
            $cotizacion->cliente_id = $request->cliente_id;
            $cotizacion->tipo_de_pago_id = $request->tipo_de_pago_id;
            $cotizacion->sub_total = 0;
            $cotizacion->descuento = $request->descuento ? $request->descuento : 0;

            $cotizacion_detalle = array();
            foreach ($request->cotizacion_detalle as $producto) {
                $cotizacion->sub_total = $cotizacion->sub_total + ($producto["cantidad"] * $producto["precio_unitario"]);
            }
            $cotizacion->igv = ($cotizacion->sub_total - $cotizacion->descuento) * DB::table('variables')->where('nombre', 'igv')->value('valor');
            $cotizacion->total = ($cotizacion->sub_total - $cotizacion->descuento) +  $cotizacion->igv;
            $cotizacion->save();

            foreach ($request->cotizacion_detalle as $vd) {
                $cotizacion_detalle = new CotizacionDetalle();
                $cotizacion_detalle->cotizacion_id = $cotizacion->id;
                $cotizacion_detalle->producto_id = $vd["producto_id"];
                $cotizacion_detalle->cantidad = $vd["cantidad"];
                $cotizacion_detalle->precio_unitario = $vd["precio_unitario"];
                $cotizacion_detalle->total = $vd["cantidad"] * $vd["precio_unitario"];
                $cotizacion_detalle->save();
            }

            DB::commit();
            return response()->json(['status'=> 'success','msg' => "Cotizacion registrada con éxito"]);

        }catch(\Exception $e){
            DB::rollback();
            return response()->json(['status'=> 'error','msg' => "Error al registrar cotizacion", "error"=> $e]);
        }
}

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
