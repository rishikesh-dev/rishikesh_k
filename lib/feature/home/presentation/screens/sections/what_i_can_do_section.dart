import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/core/constants/constants.dart';
import 'package:portfolio_v2/feature/home/presentation/blocs/what_i_can_do/bloc/what_i_can_do_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WhatICanDoSection extends StatelessWidget {
  const WhatICanDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'What I can do',
          style: TextStyle(fontFamily: AppConstants.silkScreen, fontSize: 25),
        ),
        const SizedBox(height: 20),
        BlocBuilder<WhatICanDoBloc, WhatICanDoState>(
          builder: (context, state) {
            if (state is WhatIcanDoLoading) {
              return Skeletonizer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCardSkeleton(),
                    _buildCardSkeleton(),
                    _buildCardSkeleton(),
                  ],
                ),
              );
            }
            if (state is WhatIcanDoLoaded) {
              return Row(
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
            return SizedBox();
          },
        ),
      ],
    );
  }

  Widget _buildCard(String imgUrl, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
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

  Widget _buildCardSkeleton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(height: 150, width: 150, color: Colors.grey.shade800),
          const SizedBox(height: 10),
          Container(height: 20, width: 100, color: Colors.grey.shade800),
        ],
      ),
    );
  }
}
