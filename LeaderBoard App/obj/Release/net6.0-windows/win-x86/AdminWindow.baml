   M S B A M L   `   `   `  ���� J  FLeaderBoard App, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:LeaderBoard_AppLeaderBoard_App  !    LeaderBoard_App.AdminWindow   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     /localclr-namespace:LeaderBoard_App       � Title$  AdminWindow��$
��1080��$
��1920�� � WindowState$ 	Maximized=�.���  � RowDefinitions �� .+��� $
��Left=�$��
10,0,0,882q�
���   �$	��774��$	��165��$��Bottom=��� $
��Left=�$	��133��$��
10,180,0,0q�
���   �$	��Top=�$	��774���� $
��Left=�$	��133��$��
10,313,0,0q�
���   �$	��Top=�$	��774���� $
��Left=�$��	13,17,0,0q�$
��Wrap=�$	��Top=�$
��Bold"�$��	Underline{��� $�
Data Grid ����  � Language$ en-gb�$�
Submission���� $�:���� $
��Left=�$��
13,182,0,0q�$
��Wrap=�$	��Top=�$
��Bold"�$��	Underline{��� $ en-gb�$�Data Grid Options:���� $
��Left=�$��
13,315,0,0q�$
��Wrap=�$	��Top=�$
��Bold"�$��	Underline{��� $ en-gb�$�Main Window Options:���� $
��Left=�$	��133��$��
13,921,0,0q�
���   �$	��Top=�$	��774���� $
��Left=�$��
16,923,0,0q�$
��Wrap=�$	��Top=�$
��Bold"�$��	Underline{��� $
�Load���� $ en-gb�$� + Start���� $�	 Options:���� $
��Left=�$	��133��$��
13,788,0,0q�
���   �$	��Top=�$	��774���� $
��Left=�$��
16,790,0,0q�$
��Wrap=�$	��Top=�$
��Bold"�$��	Underline{��� $ en-gb�$�Export Options:���� $
��Left=�$	��133��$��
10,446,0,0q�
���   �$	��Top=�$	��774���� $
��Left=�$��
14,446,0,0q�$
��Wrap=�$	��Top=�$
��Bold"�$��	Underline{�$��Leaderboard Options:���� -    ��Name$ cobLeaderboardSelect��$
��Left=�$��
433,78,0,0q�$	��Top=�$	��120���� -   $��tbNameEntry��$��	18,90,0,0q� �� TextWrapping$
 Wrap=�$��
Enter Name��$	��Top=�$
��Left=�$	��120���� -   $��btSubmitName��$��Submit!��$
��Left=�$��
603,80,0,0q�$	��Top=��� -   $��	tbIdEntry��$
��Left=�$��101,212,0,0q�$
 Wrap=�$��Enter ID��$	��Top=�$	��120���� -   $��btShowIdMain��$��Show on Main Window��$
��Left=�$��242,206,0,0q�$	��Top=��� -   $��Start Timer��$
��Left=�$��
180,70,0,0q�$	��Top=��� -   $��
Stop Timer��$
��Left=�$��
180,95,0,0q�$	��Top=�$��62���� -   $��Reset Timer��$
��Left=�$��244,126,0,0q�$	��Top=�$��62���� -	    ��Name$ txtAdminTimer��$
��Wrap=�$��65��$	��159��$��45(�$
��Left=�$	��Top=�$��	UltraBold"�$��
254,61,0,0q��� $ en-gb�$�0���� $
��Left=�$��
448,53,0,0q�$
��Wrap=�$	��Top=�$��	Underline{�$��15(��� $ en-gb�$�Leaderboards���� -
   $ cobLeaderboardOptions��$
��Left=�$��109,469,0,0q�$	��Top=�$	��120���� -   $��tbLeaderoardOptionsName��$
��Left=�$��109,504,0,0q�$
 Wrap=�$��Leaderboard Name...��$	��Top=�$	��120���� -   $��btLeaderboardOptionsEdit��$
��Edit��$
��Left=�$��254,470,0,0q�$	��Top=��� -   $ ��btLeaderboardOptionsSubmit��$��Submit Changes��$
��Left=�$��253,503,0,0q�$	��Top=��� $
��Left=�$��109,536,0,0q�$	��Top=�$	��157��.@���  �� 
IsSelected$
 True��$��Colour *In Development���� $��Coming Soon!��&   System.Windows.Controls.DataGrid  -   $��dgAdminLeaderbooard��   
IsReadOnly$
 True��$��1024,0,500,0q�	 J� RenderTransformOrigin$	 1,0.5&�z�V� .~�T� 
 T� X$	
 500Q��� -   $��btnStandbyTab��$��Standby��$
��Left=�$��
66,377,0,0q�$	��Top=��� -   $��btnLeaderboardTab��$��Leaderboard��$
��Left=�$��134,377,0,0q�$	��Top=��� -   $��btnTimerTab��$��Timer��$
��Left=�$��225,377,0,0q�$	��Top=��� $
��Left=�$��
56,356,0,0q�$
��Wrap=�$	��Top=�$��	Underline{��� $�Set Main���� $ en-gb�$� ���� $�Window View���� $ en-gb�$�:���� -   $��txtCurrentView��$
��Left=�$��410,374,0,0q�$
��Wrap=�$	��Top=�$��20(��� $ en-gb�$ �Current View = ___________���� -   $$��Create Winners Pdf Certificate��$
��Left=�$��
59,845,0,0q�$	��Top=��� -   $
��Load��$
��Left=�$��114,978,0,0q�$	��Top=��� -   $��New Save��$
��Left=�$��193,978,0,0q�$	��Top=�$	 -0.505,0.725&��� $
��Left=�$��199,1019,0,0q�$
��Wrap=�$	��Top=��� $�*All changes automa���� $�tically save���� $ en-gb�$2�,d after new save file made or old one loaded���� -   $��
tbNameEdit��$
��Left=�$��101,252,0,0q�$
 Wrap=�$��Name...��$	��Top=�$	��120���� -   $��tbSecondsEdit��$
��Left=�$��101,278,0,0q�$
 Wrap=�$��
Seconds...��$	��Top=�$	��120���� -   $
��Edit��$
��Left=�$��242,251,0,0q�$	��Top=��� -   $��Submit Changes��$
��Left=�$��242,278,0,0q�$	��Top=��� $
��Left=�$��540,198,0,0q�$
��Wrap=�$	��Top=�$��	Underline{�$��15(��� $ en-gb�$�Filters:���� -   $��cobLeaderboardFilter��$
��Left=�$��505,223,0,0q�$	��Top=�$	��120���� $��921,24,660,699q�$��/AstronautLogo.png���� -   $��cbAutoWindowSwitch�� d� 	IsChecked$
 TrueY�$��Auto Window Switching��$
��Left=�$��266,335,0,0q�$	��Top=��� -    ��Name$ btRemoveId_Copy��$��Remove��$
��Left=�$��165,187,0,0q�$	��Top=��� -    ��Name$ cbWindowFullscreen��$��Main Window Fullscreen��$
��Left=�$��587,338,0,0q�$	��Top=�