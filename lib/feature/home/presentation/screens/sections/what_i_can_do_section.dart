import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/what_i_can_do/bloc/what_i_can_do_bloc.dart';

class WhatICanDoSection extends StatelessWidget {
  const WhatICanDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Column(
      spacing: 50,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'What I can do',
          style: TextStyle(fontFamily: AppConstants.silkScreen, fontSize: 35),
        ),
        BlocBuilder<WhatICanDoBloc, WhatICanDoState>(
          builder: (context, state) {
            if (state is WhatIcanDoLoading) {
              return CircularProgressIndicator();
            }
            if (state is WhatIcanDoLoaded) {
              return isMobile
                  ? Column(
                    spacing: 40,
                    children:
                        state.getCards
                            .map(
                              (card) => _buildCard(
                                card.imgUrl,
                                card.title,
                                isMobile: true,
                              ),
                            )
                            .toList(),
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        state.getCards.map((card) {
                          return _buildCard(card.imgUrl, card.title);
                        }).toList(),
                  );
            }
            if (state is WhatIcanDoError) {
              return Center(child: Text(state.message));
            }
            return SizedBox(child: Text('No Data'));
          },
        ),
      ],
    );
  }

  Widget _buildCard(String imgUrl, String title, {bool? isMobile = false}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isMobile! ? 0 : 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade900,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imgUrl, height: 200, width: 200, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
