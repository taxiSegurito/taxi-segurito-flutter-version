import 'package:flutter/material.dart';

  List<Widget> insertStars(double avgAux, size)
  {
    List<Widget> temporal = [];
    IconData iconType = Icons.star_rounded;  
    //temporal.add(_insertAVG());
    for(var i = 0; i<5; i++)
    {
      if(avgAux < 1)
      { 
        if(avgAux < 0.3)
        {
          iconType = Icons.star_border_rounded;
        }
        else if(avgAux < 0.8)
        {
          iconType = Icons.star_half_rounded;
        }
      }
      Widget item = Icon(
          iconType, color:Colors.yellow, size: size,
        );
      temporal.add(item);
      avgAux = avgAux-1;
    }
    return temporal;
  }

   Widget insertTextAVG(double avg, size)
  {
    return Text(avg.toString(),style: TextStyle(fontFamily: 'Raleway',fontSize: size),);
  }