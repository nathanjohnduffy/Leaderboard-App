   M S B A M L   `   `   `  ����J  FLeaderBoard App, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:LeaderBoard_AppLeaderBoard_App  5   	        LeaderBoard_App.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:LeaderBoard_App     5   	     � Title$  
MainWindow��5   	   $
��1080��6   $
��1920��6*   .��5	      �  � ColumnDefinitions 5
   
   �� 5      .+�5   
   �� -   5         ��Name$
 Tabs��5      $��	0,-24,0,0q�6#   .@�5      �� $��Leaderboard��6   .��5      � ��5      �� 5       �� ImageSource$ /SpaceBackground.jpg��6%    j� Stretch$ Uniform=�6H    j� TileMode$
 Tile=�6Z    j� ViewportUnits$ Absolute=�6j    j� Viewport$ 0,-1500,3000,3000�6�    �� 	Transform 5      V� 5   "   .~�5   &   �� 	 �� ScaleX$		 0.9Q�65   
 �� ScaleY$	
 0.9Q�6B   �� 5   &   �� 5   &   T� 5   &    T� X$
 -400Q�69    T� Y$
 -300Q�6B   5   #   5      .+�5      �� $	��100q�64   ��6   Z�  J� BitmapEffect 5      F� 5        F� Color$ Black��65    F� ShadowDepth$ 20Q�6C    F� Softness$	 0.8Q�6T   ._�5"      � .+�5#      �� -   5         ��Name$ 	BDRounded��5#   %   $��0q�68   $��30, 50q�6L    �� CornerRadius$ 60��6\   
�������6n   &   System.Windows.Controls.DataGrid  5$      -   5        $��dgLeaderbaord��5$   ^   $��10q�6'      
IsReadOnly$
 True��6s      HeadersVisibility$ Column=�6�   $��50(�6�   $��Arial)�6�   $��20,20,20,20q�6�   $
}�True��6�    J� SnapsToDevicePixels$
 True��6�      RowBackground �	#FF5D8AA6��6(  Z�  J� OpacityMask 5%   "   !� 5&   &    !� Visual 62   ��  �� ElementName$ 	BDRounded�� � 	Resources 5(   "   *  $System.Windows.Controls.DataGridCell �� 
TargetType �� Property �� Value)  #System.Windows.Controls.DataGridRow��%T  '        '  �     '  �     �� 5)   &   "  6,   .�5*   *   ��  � ��$ Center=�6W   �� 5+   *    �@��TextAlignment$ Center=�6T   �� 5,   *    � ��$ 10q�6C   5-   '   �� 5.   &   "  6,   .�5/   *   ��  � ��$ 10q�6L   50   '   �� 51   &   "  6,   .�52   *   ��  � ��$ 10q�6D   53   '   54   #   ��55   "   �� 56   &    �� Color$ White��66      ColumnHeaderStyle 58   "   �� 59   &   =  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6,   .�5:   *   ��  � �� �	#FFCE641D6G   �� 5;   *    � ��$
 Bold"�6G   �� 5<   *    � ��$ Center=�6W   �� 5=   *    � ��
 �   �6H   �� 5>   *    � ��$ 3q�6L   5?   '   z�5A   "   V� 5B   &   .~�5C   *   �� �� 5D   *   �� 5E   *   T� 5F   *   $ 15Q�6=   5G   '   5I      5J      5K      �� 5N      $��\astronaut.png��6   $
��Left=�64   $
��1024��6O   $��1071,141,0,0q�6]   $	��Top=�6s   $
��1169��6�   5O      5P      �� 5R      $��Timer��6   .��5S      � .+�5T      �� -   5          ��Name$  txtTimer��5T       $
��Wrap=�62   $	��639��6F   $
��1550��6S   $	��500(�6`   $��Center=�6o   $	��Top=�6�   ! �� TextAlignment$! Center=�6�   $��	UltraBold"�6�   
�������$��	0,184,0,0q�6�   �� 6�   " � Language$" en-gb�6�   $�0��6  6  �� 5U      -   5        $  txtTimerPrep��5U       $
��Wrap=�66   $	��288��6J   $	��826��6W   $	��200(�6c   $��Center=�6r   $	��Top=�6�   $! Center=�6�   $
��Bold"�6�   
�������$��	0,762,0,0q�6�   $��Segoe UI Light)�6�   $�� ��6  ��5V      �� 5W      $ /SpaceBackground.jpg��6%   $ Uniform=�6H   $
 Tile=�6Z   $ Absolute=�6j   $ 0,-1500,3000,3000�6�    5X      V� 5Y   "   .~�5Z   &   �� $		 0.9Q�65   $	
 0.9Q�6B   �� 5[   &   �� 5\   &   T� 5]   &   $
 -400Q�69   $
 -300Q�6B   5^   #   5`      5b      5c      �� 5e      $��Standby��6   .��5f      � ��5g      �� 5h      $ /SpaceBackground.jpg��6%   $ Uniform=�6H   $
 Tile=�6Z   $ Absolute=�6j   $ 0,-1500,3000,3000�6�    5i      V� 5j   "   .~�5k   &   �� $		 0.9Q�65   $	
 0.9Q�6B   �� 5l   &   �� 5m   &   T� 5n   &   $
 -400Q�69   $
 -300Q�6B   5o   #   5q      .+�5s      �� $��Center=�6    $	��836��6=   $��Center=�6J   $
��1914��6e   $	��240(�6r   $! Center=�6�   $��Arial)�6�   $
��Wrap=�6�   $��	UltraBold"�6�   
��������� 6�   $�How fast can��6�   �� 6  �� 6  $�you fix your spacecraft?��6  67  5t      5u      5v      5w      5x      