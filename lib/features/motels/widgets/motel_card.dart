import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/models/motel.dart';

class MotelCard extends StatelessWidget {
  final Motel motel;
  final double width;
  final double height;

  const MotelCard({Key? key, required this.motel, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: width * 0.9, 
            child: Row(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipOval(
                        child: Image.network(
                          motel.logo,
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: width * 0.04),
                  ],
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  motel.fantasia,
                                  style: const TextStyle(
                                      fontSize: 24),
                                ),
                                Text(motel.bairro),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                IconButton(
                                  alignment: Alignment.centerRight,
                                  icon: const Icon(Icons.favorite_border),
                                  onPressed: () {},
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                Text("${motel.media} (${motel.qtdAvaliacoes} avaliações)"),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          height: 800, 
          child: PageView.builder(
            physics: const ClampingScrollPhysics(),
            controller: PageController(viewportFraction: 0.9),
            itemCount: motel.suites.length, 
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.000025),
                      child: Card(
                        color: Colors.white,
                        elevation: 0.25,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: width * 0.015),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(6)),
                                child: Image.network(
                                  motel.suites[index].fotos[0],
                                  height: 250,
                                  width: width * 0.85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(motel.suites[index].nome, style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis), maxLines: 1,),
                            ),
                            SizedBox(height: width * 0.015),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  Positioned(
                    top: height * 0.36, 
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.000025),
                      child: Card(
                        color: Colors.white,
                        elevation: 0.25,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          height: height * 0.085, 
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i = 0; i < 4; i++)
                                if (motel.suites[index].categorias[i].icone != null)
                                 Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: 
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey.shade100,
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                      motel.suites[index].categorias[i].icone!,
                                      height: 50, 
                                      width: 50),
                                  ),
                                ),
                                 Container(
                                  width: 60,
                                  height: 50,
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Text('     ver\n todos', style: TextStyle(fontSize: 12),),
                                      ),

                                      Transform.rotate(
                                        angle: 1.5708,
                                        child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey)),],
                                  ),

                                )

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
             for (var i = 0; i < motel.suites[index].periodos.length; i++)
              Positioned(
                top: height * 0.45 + i * height * 0.1016,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.000025),
                  child: Card(
                    color: Colors.white,
                    elevation: 0.25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(motel.suites[index].periodos[i].tempoFormatado == '12 horas' ? 'Pernoite' : motel.suites[index].periodos[i].tempoFormatado, style: const TextStyle(fontSize: 20)),
                                      if (motel.suites[index].periodos[i].desconto != null)
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: const BorderSide(color: Colors.green, width: 1))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              '${((motel.suites[index].periodos[i].desconto!.valor / motel.suites[index].periodos[i].valorTotal) * 100).toStringAsFixed(0)}% off',
                                              style: const TextStyle(fontSize: 10, color: Colors.green),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                   
                                   Row(
                                     children: [
                                      if (motel.suites[index].periodos[i].desconto != null)
                                      Text(
                                        'R\$ ${motel.suites[index].periodos[i].valor.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Colors.grey,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('R\$ ${motel.suites[index].periodos[i].valorTotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
                                     ],
                                   ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
                 
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}


