<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Schema;
use App\Cliente;

use Illuminate\Http\Request;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $where = json_decode($request->where);
        $orderby = [
            'column' =>  $request->orderby ? $request->orderby : 'id',
            'order' => $request->desc ? ($request->desc=='true'? 'desc' : 'asc') : 'asc'
        ];
        $limit = $request->limit ? $request->limit : 1000;

        $w_razon_social = isset($where->razon_social) ? '%' . $where->razon_social . '%' : null;
        $clientes = Cliente::when($w_razon_social, function ($query) use ($w_razon_social) {
                return $query->where('razon_social', 'like', $w_razon_social);
            })
            ->orderBy($orderby['column'], $orderby['order'])
            ->paginate($limit);

        return response()->responserApi(false, $clientes, true);
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
            /*$cliente = new Cliente;
            $cliente->nombres = $request->nombres;
            $cliente->apellidos = $request->apellidos;
            $cliente->save();*/


            $cliente = Cliente::create($request->all());
            return response()->responserApi(false, $cliente, true);

        }catch(\Exception $e){
            return response()->responserApi($e, false, true);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   try{
            $cliente = Cliente::find($id);
        return response()->responserApi(false, $cliente, true);

        }catch(\Exception $e){
            return response()->responserApi($e, false, true);
        }
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
        try{
            $cliente = Cliente::find($id);

            $cliente->codigo = $request->codigo;
            $cliente->tipo = $request->tipo;
            $cliente->razon_social = $request->razon_social;
            $cliente->numero_documento = $request->numero_documento;
            $cliente->persona_contacto = $request->persona_contacto;
            $cliente->rubro = $request->rubro;
            $cliente->ubigeo = $request->ubigeo;
            $cliente->direccion = $request->direccion;
            $cliente->telefono1 = $request->telefono1;
            $cliente->telefono2 = $request->telefono2;
            $cliente->email = $request->email;
            $cliente->pagina_web = $request->pagina_web;
            $cliente->observacion = $request->observacion;

            $cliente->save();

            return response()->responserApi(false, $cliente, true);
        }catch(\Exception $e){
            return response()->responserApi($e, false, true);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $cliente = Cliente::find($id);
            $cliente->delete();

            return response()->responserApi(false, $cliente, true);

        }catch(\Exception $e){
            return response()->responserApi($e, false, true);
        }
    }

    public function getVentas($id){
        $ventas = Cliente::find($id)->ventas;
        return response()->json($ventas);
    }
}
