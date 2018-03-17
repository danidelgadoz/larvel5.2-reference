<?php

namespace App\Http\Controllers;

use App\Venta;
use App\VentaDetalle;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ventas = Venta::all();
        return response()->json($ventas);
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

            $venta = new Venta();
            $venta->documento = $request->documento;
            $venta->numero_documento = time();
            $venta->contacto = $request->contacto;
            $venta->fecha_emision = date("Y-m-d H:i:s");
            $venta->fecha_envio = $request->fecha_envio;
            $venta->moneda = $request->moneda;
            $venta->abono = $request->abono;
            $venta->orden_compra = $request->orden_compra;
            $venta->estado_pago = $request->estado_pago;
            $venta->estado = 'CONTABLE';
            $venta->observaciones = $request->observaciones;
            $venta->cotizacion = $request->cotizacion;
            $venta->cliente_id = $request->cliente_id;
            $venta->tipo_de_pago_id = $request->tipo_de_pago_id;
            $venta->sub_total = 0;
            $venta->descuento = $request->descuento ? $request->descuento : 0;
            
            $venta_detalle = array();
            foreach ($request->venta_detalle as $producto) {                
                $venta->sub_total = $venta->sub_total + ($producto["cantidad"] * $producto["precio_unitario"]);                
            }
            $venta->igv = ($venta->sub_total - $venta->descuento) * DB::table('variables')->where('nombre', 'igv')->value('valor');
            $venta->total = ($venta->sub_total - $venta->descuento) +  $venta->igv;
            $venta->save();
            
            foreach ($request->venta_detalle as $vd) {
                $venta_detalle = new VentaDetalle();
                $venta_detalle->venta_id = $venta->id;
                $venta_detalle->producto_id = $vd["producto_id"];
                $venta_detalle->cantidad = $vd["cantidad"];
                $venta_detalle->precio_unitario = $vd["precio_unitario"];
                $venta_detalle->total = $vd["cantidad"] * $vd["precio_unitario"];
                $venta_detalle->save();                
            }
            
            DB::commit();
            return response()->json(['status'=> 'success','msg' => "Venta registrada con éxito"]);

        }catch(\Exception $e){
            DB::rollback();
            return response()->json(['status'=> 'error','msg' => "Error al registrar venta", "error"=> $e]);            
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
        $venta = Venta::find($id);
        return response()->json($venta);
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
        // return "hola papu papu: " .  $id;
        $venta = Venta::find($id);        
        $venta->fill($request->all());
        $venta->save();
        // dump($venta);
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

    public function getVentaDetalle($id){
        $venta_detalle = Venta::find($id)->venta_detalles;        
        return response()->json($venta_detalle);
    }
}
