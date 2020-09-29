
import 'package:testeweb/core/model/cliente.dart';
import 'package:testeweb/core/model/loja.dart';
import 'package:testeweb/core/model/pedidoitem.dart';

class Pedido {
  int id;
  String descricao;
  String dataHoraEntrega;
  int valorFrete;
  int valorDesconto;
  int valorTotal;
  List<PedidoItem> pedidoItems;
  Cliente cliente;
  Loja loja;
  String statusPedido;
  String formaPagamento;
  Null dataEntrega;
  Null horarioEntrega;
  bool novo;
  bool existente;
  int valorTotalItens;
  bool salvarPermitido;
  bool vazio;
  bool emitido;
  int diasCriacao;
  bool salvarProibido;

  Pedido(
      {this.id,
        this.descricao,
        this.dataHoraEntrega,
        this.valorFrete,
        this.valorDesconto,
        this.valorTotal,
        this.pedidoItems,
        this.cliente,
        this.loja,
        this.statusPedido,
        this.formaPagamento,
        this.dataEntrega,
        this.horarioEntrega,
        this.novo,
        this.existente,
        this.valorTotalItens,
        this.salvarPermitido,
        this.vazio,
        this.emitido,
        this.diasCriacao,
        this.salvarProibido});

  Pedido.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    dataHoraEntrega = json['dataHoraEntrega'];
    valorFrete = json['valorFrete'];
    valorDesconto = json['valorDesconto'];
    valorTotal = json['valorTotal'];
    if (json['pedidoItems'] != null) {
      pedidoItems = new List<PedidoItem>();
      json['pedidoItems'].forEach((v) {
        pedidoItems.add(new PedidoItem.fromJson(v));
      });
    }
    cliente =
    json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
    loja = json['loja'] != null ? new Loja.fromJson(json['loja']) : null;
    statusPedido = json['statusPedido'];
    formaPagamento = json['formaPagamento'];
    dataEntrega = json['dataEntrega'];
    horarioEntrega = json['horarioEntrega'];
    novo = json['novo'];
    existente = json['existente'];
    valorTotalItens = json['valorTotalItens'];
    salvarPermitido = json['salvarPermitido'];
    vazio = json['vazio'];
    emitido = json['emitido'];
    diasCriacao = json['diasCriacao'];
    salvarProibido = json['salvarProibido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['dataHoraEntrega'] = this.dataHoraEntrega;
    data['valorFrete'] = this.valorFrete;
    data['valorDesconto'] = this.valorDesconto;
    data['valorTotal'] = this.valorTotal;
    if (this.pedidoItems != null) {
      data['pedidoItems'] = this.pedidoItems.map((v) => v.toJson()).toList();
    }
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    if (this.loja != null) {
      data['loja'] = this.loja.toJson();
    }
    data['statusPedido'] = this.statusPedido;
    data['formaPagamento'] = this.formaPagamento;
    data['dataEntrega'] = this.dataEntrega;
    data['horarioEntrega'] = this.horarioEntrega;
    data['novo'] = this.novo;
    data['existente'] = this.existente;
    data['valorTotalItens'] = this.valorTotalItens;
    data['salvarPermitido'] = this.salvarPermitido;
    data['vazio'] = this.vazio;
    data['emitido'] = this.emitido;
    data['diasCriacao'] = this.diasCriacao;
    data['salvarProibido'] = this.salvarProibido;
    return data;
  }
}