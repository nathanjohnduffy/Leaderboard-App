   M S B A M L   `   `   `  ���� J  FLeaderBoard App, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:LeaderBoard_AppLeaderBoard_App       LeaderBoard_App.MainWindow   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     /localclr-namespace:LeaderBoard_App       � Title$  
MainWindow��$
��1080��$
��1920��.���  � ColumnDefinitions �� .+��� -    ��Name$
 Tabs��$��	0,-24,0,0q�.@��� $��Leaderboard��.��� ����  �� ImageSource$ /SpaceBackground.jpg�� j� Stretch$ Uniform=� j� TileMode$
 Tile=� j� ViewportUnits$ Absolute=� j� Viewport$ 0,-1500,3000,3000� �� 	Transform V� .~��� 	 �� ScaleX$		 0.9Q�
 �� ScaleY$	
 0.9Q��� �� T�  T� X$
 -400Q� T� Y$
 -300Q�.+��� $	��100q���Z�  J� BitmapEffect F�  F� Color$ Black�� F� ShadowDepth$ 20Q� F� Softness$	 0.8Q�._�� .+��� -    ��Name$ 	BDRounded��$��0q�$��30, 50q� �� CornerRadius$ 60��
�������&   System.Windows.Controls.DataGrid  -   $��dgLeaderbaord��$��10q�   
IsReadOnly$
 True��   HeadersVisibility$ Column=�$��50(�$��Arial)�$��20,20,20,20q�$
}�True�� J� SnapsToDevicePixels$
 True��   RowBackground �	#FF5D8AA6��Z�  J� OpacityMask !�  !� Visual ��  �� ElementName$ 	BDRounded�� � 	Resources *  $System.Windows.Controls.DataGridCell �� 
TargetType �� Property �� Value)  #System.Windows.Controls.DataGridRow��%�   '        '  e     '  �     �� "  .���  � ��$ Center=���  �@��TextAlignment$ Center=���  � ��$ 10q��� "  .���  � ��$ 10q��� "  .���  � ��$ 10q�����  �� Color$ White��   ColumnHeaderStyle �� =  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  � �� �	#FFCE641D��  � ��$
 Bold"���  � ��$ Center=���  � ��
 �   ���  � ��$ 3q�z�V� .~��� �� �� T� $ 15Q��� $��\astronaut.png��$
��Left=�$
��1024��$��1071,141,0,0q�$	��Top=�$
��1169���� $��Timer��.��� .+��� -     ��Name$  txtTimer��$
��Wrap=�$	��639��$
��1550��$	��500(�$��Center=�$	��Top=�! �� TextAlignment$! Center=�$��	UltraBold"�
�������$��	0,184,0,0q��� " � Language$" en-gb�$�0���� -   $  txtTimerPrep��$
��Wrap=�$	��288��$	��826��$	��200(�$��Center=�$	��Top=�$! Center=�$
��Bold"�
�������$��	0,762,0,0q�$��Segoe UI Light)�$�� ������ $ /SpaceBackground.jpg��$ Uniform=�$
 Tile=�$ Absolute=�$ 0,-1500,3000,3000� V� .~��� $		 0.9Q�$	
 0.9Q��� �� T� $
 -400Q�$
 -300Q��� $��Standby��.��� ���� $ /SpaceBackground.jpg��$ Uniform=�$
 Tile=�$ Absolute=�$ 0,-1500,3000,3000� V� .~��� $		 0.9Q�$	
 0.9Q��� �� T� $
 -400Q�$
 -300Q�.+��� $��Center=�$	��836��$��Center=�$
��1914��$	��240(�$! Center=�$��Arial)�$
��Wrap=�$��	UltraBold"�
��������� $�How fast can���� �� $�you fix your spacecraft?��