using Microsoft.Win32;
using System;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static LeaderBoard_App.MainWindow;
using System.Net;
using System.ComponentModel;
using System.Runtime.Serialization;
using System.Reflection.Metadata;
using GemBox.Pdf;
using System.Diagnostics;

namespace LeaderBoard_App
{
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {

        string currentSavePath;

        List<Entry> leaderboard = new List<Entry>();
        //EXAMPLE ENTRY: "leaderboard.Add(new Entry() { Id = 1, Name = "John Doe", Seconds = 0});

        DataGrid dgLeaderboard = ((MainWindow)Application.Current.MainWindow).dgLeaderbaord;
        TextBlock txtTimer = ((MainWindow)Application.Current.MainWindow).txtTimer;
        TabControl Tabs = ((MainWindow)Application.Current.MainWindow).Tabs;
        TextBlock txtTimerPrep = ((MainWindow)Application.Current.MainWindow).txtTimerPrep;
        MainWindow MainWindow = ((MainWindow)Application.Current.MainWindow);

        string[] leaderboardNames = {"LB 1", "LB 2", "LB 3", "LB 4", "LB 5"};
        string[] leaderboardNamesNumbered = {"", "", "", "", "", ""};
        string[] leaderboardNamesAll = {"", "", "", "", "", ""};
        string[] emptyList = { };

        int timerSeconds = 0;
        bool timerRunning = false;

        public AdminWindow()
        {
            InitializeComponent();
            StartupAsync();
            updateLeaderboardDetailsUI();
        }

        public class Entry
        {
            public int Id { get; set; }

            public int Lb { get; set; }

            public int Rank { get; set; }

            public string Name { get; set; }

            public int Seconds { get; set; }
        }

        public void UpdateGrids()
        {
            CollectionViewSource.GetDefaultView(dgLeaderboard.ItemsSource).Refresh();
            CollectionViewSource.GetDefaultView(dgAdminLeaderbooard.ItemsSource).Refresh();
            FilterLeaderboard(null, null);
        }

        public void sortLeaderboard()
        {
            leaderboard.Sort(delegate (Entry e1, Entry e2) { return e1.Seconds - e2.Seconds; });
            for (int i = 0; i < leaderboard.Count; i++)
            {
                leaderboard[i].Rank = i+1;
            }
        }

        public void MainWindowFullscreen(object sender, RoutedEventArgs e)
        {
            if (cbWindowFullscreen.IsChecked == true)
            {
                MainWindow.WindowState = WindowState.Maximized;
                MainWindow.WindowStyle = WindowStyle.None;
                MainWindow.Topmost = true;
            }
            else
            {
                MainWindow.WindowState = WindowState.Maximized;
                MainWindow.WindowStyle = WindowStyle.SingleBorderWindow;
                MainWindow.Topmost = false;
            }
        }

        public void mainWindowViewId(object sender, RoutedEventArgs e)
        {
            int index = leaderboard.FindIndex(x => x.Id == int.Parse(tbIdEntry.Text));
            dgLeaderboard.SelectedItem = dgLeaderboard.Items[index];
            dgAdminLeaderbooard.SelectedItem = dgAdminLeaderbooard.Items[index];
            dgLeaderboard.ScrollIntoView(dgLeaderboard.Items[index]);
            dgAdminLeaderbooard.ScrollIntoView(dgLeaderboard.Items[index]);
        }

        public bool AddToList(int Lb, string Name, int Time)
        {
            if (Lb == 0) // for sumbit button
            {
                if (CheckLeaderboardFields())
                {
                    leaderboard.Add(new Entry() { Id = dgLeaderboard.Items.Count, Lb = FindLbRBSelect(), Rank = 0, Name = Name, Seconds = Time });
                    ChangedLeaderboard();
                    switchTab(btnLeaderboardTab, null);
                    dgLeaderboard.SelectedItem = dgLeaderboard.Items[leaderboard[dgLeaderboard.Items.Count - 1].Rank - 1];
                    dgAdminLeaderbooard.SelectedItem = dgLeaderboard.Items[leaderboard[dgLeaderboard.Items.Count - 1].Rank - 1];
                    dgLeaderboard.ScrollIntoView(dgLeaderboard.Items[leaderboard[dgLeaderboard.Items.Count - 1].Rank - 1]);
                    dgAdminLeaderbooard.ScrollIntoView(dgLeaderboard.Items[leaderboard[dgLeaderboard.Items.Count - 1].Rank - 1]);
                    return true;
                }
            }
            else // for loading save
            {
                leaderboard.Add(new Entry() { Id = leaderboard.Count, Lb = Lb, Rank = 0, Name = Name, Seconds = Time });
            }
            return false;
        }

        public void RemoveFromList(string Id)
        {
            try
            {
                leaderboard.RemoveAt(leaderboard.FindIndex( x => x.Id == int.Parse(Id)));
            } catch { }
            ChangedLeaderboard();
        }

        public void UpdateEditDetails(object sender, RoutedEventArgs e)
        {
            EditList(int.Parse(tbIdEntry.Text), tbNameEdit.Text, int.Parse(tbSecondsEdit.Text));
        }

        public void DisplayEditDetails(object sender, RoutedEventArgs e)
        {
            int Index = leaderboard.FindIndex(x => x.Id == int.Parse(tbIdEntry.Text));
            tbNameEdit.Text = leaderboard[Index].Name;
            tbSecondsEdit.Text = leaderboard[Index].Seconds.ToString();
        }

        public void ChangedLeaderboard()
        {
            sortLeaderboard();
            UpdateGrids();
            saveDataDecision(null, null);
        }

        public bool CheckLeaderboardFields()
        {
            if (FindLbRBSelect() != 0)
            {
                if (tbNameEntry.Text != "Enter Name")
                {
                    if (timerSeconds != 0)
                    {
                        return true;
                    }
                }
            }
            MessageBox.Show("Not ALL fields filled in before submission.", "Error, Complete Entry!");
            return false;
        }

        public void EditList(int Id, string Name, int Seconds)
        {
            int Index = leaderboard.FindIndex(x => x.Id == Id);
            leaderboard[Index].Name = Name;
            leaderboard[Index].Seconds = Seconds;
            ChangedLeaderboard();
        }

        public void FilterLeaderboard(object? sender, EventArgs? e)
        {

            FilterLbCode(cobLeaderboardFilter.SelectedIndex);
        }

        public void FilterLbCode(int Lb)
        {
            if (Lb == 0)
            {
                sortLeaderboard();
                dgLeaderboard.ItemsSource = null;
                dgAdminLeaderbooard.ItemsSource = null;
                dgLeaderboard.ItemsSource = leaderboard;
                dgAdminLeaderbooard.ItemsSource = leaderboard;
                dgLeaderboard.Columns.RemoveAt(1);
                dgLeaderboard.Columns.RemoveAt(0);
            }
            else
            {
                FilterLbFunction(Lb);
            }
        }

        public void FilterLbFunction(int Lb)
        {
            ListCollectionView collectionView = new ListCollectionView(leaderboard);
            collectionView.Filter = (e) =>
            {
                Entry ent = e as Entry;
                if (ent.Lb == Lb)
                    return true;
                return false;
            };

            int x = 0;
            leaderboard.Sort(delegate (Entry e1, Entry e2) { return e1.Seconds - e2.Seconds; });
            for (int i = 0; i < leaderboard.Count; i++)
            {
                if (collectionView.Contains(leaderboard[i]))
                {
                    x++;
                    leaderboard[i].Rank = x;
                }
                else
                {
                    leaderboard[i].Rank = leaderboard.Count+2;
                }
            }

            collectionView.Filter = (e) =>
            {
                Entry ent = e as Entry;
                if (ent.Lb == Lb)
                    return true;
                return false;
            };
            dgLeaderboard.ItemsSource = collectionView;
            dgAdminLeaderbooard.ItemsSource = collectionView;
            dgLeaderboard.Columns.RemoveAt(1);
            dgLeaderboard.Columns.RemoveAt(0);
        }

        private void Submission_Click(object sender, RoutedEventArgs e)
        {
            if (AddToList(0, tbNameEntry.Text, timerSeconds)) { ResetSystem(); } // only reset if succesfull
        }

        public int FindLbRBSelect()
        {
            if (cobLeaderboardSelect.SelectedIndex == null)
            {
                return 0;
            }
            return cobLeaderboardSelect.SelectedIndex + 1;
        }

        private void ResetSystem()
        {
            timerSeconds = 0;
            txtAdminTimer.Text = "0";
            txtTimer.Text = "0";
            tbNameEntry.Text = "Enter Name";
        }

        private void DeleteSubmission_Click(object sender, RoutedEventArgs e)
        {
            RemoveFromList(tbIdEntry.Text);
        }

        private async Task StartupAsync()
        {
            dgLeaderboard.ItemsSource = leaderboard;
            dgAdminLeaderbooard.ItemsSource = leaderboard;
            await Task.Delay(2000);
            dgLeaderboard.Columns.RemoveAt(1);
            dgLeaderboard.Columns.RemoveAt(0);
            switchTab(btnStandbyTab, null);
        }

        public async Task TimerAsync()
        {
            switchTab(btnTimerTab, null);
            timerRunning = true;

            for (int i = 0; i <= 3; i++)
            {
                if (timerRunning && i == 0)
                {
                    txtTimerPrep.Text = "Ready!";
                    txtAdminTimer.Text = "Ready!";
                }
                else if (timerRunning && i == 1)
                {
                    await Task.Delay(1000);
                    txtTimerPrep.Text = "Set!";
                    txtAdminTimer.Text = "Set!";
                }
                else if (timerRunning && i == 2)
                {
                    await Task.Delay(1000);
                    txtTimerPrep.Text = "Go!";
                    txtAdminTimer.Text = "Go!";
                }
            }

            while (timerRunning)
            {
                txtTimer.Text = timerSeconds.ToString();
                txtAdminTimer.Text = timerSeconds.ToString();
                await Task.Delay(1000);
                if (timerRunning)
                {
                    timerSeconds++;
                }
            }
            txtTimer.Text = timerSeconds.ToString();
            txtAdminTimer.Text = timerSeconds.ToString();
            timerRunning = false;
        }

        public void StartTimer(object sender, RoutedEventArgs e)
        {
            TimerAsync();
        }
        public void StopTimer(object sender, RoutedEventArgs e)
        {
            timerRunning = false;
        }
        public void ResetTimer(object sender, RoutedEventArgs e)
        {
            timerSeconds = 0;
            txtTimer.Text = "0";
            txtAdminTimer.Text = "0";
        }

        public void pdfEdit(Object sender, RoutedEventArgs e)
        {
            if (leaderboard.Count != 0)
            {
                ComponentInfo.SetLicense("FREE-LIMITED-KEY");
                using (var document = PdfDocument.Load(Environment.CurrentDirectory + "/Congratulations.Pdf"))
                {
                    document.Form.Fields["NameInput"].Value = leaderboard[0].Name;
                    document.Form.Fields["DateInput"].Value = (DateTime.Now.ToString("dd/MM/yy"));
                    SaveFileDialog saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Filter = "Pdf (*.Pdf)|*.Pdf"; // File tag shown | file extension
                    if (saveFileDialog.ShowDialog() == true) // once selecte file
                    {
                        document.Save(saveFileDialog.FileName);
                    }
                }
            }
            else
            {
                MessageBox.Show("You must have something in the leaderboard for a certificate to be made.", "Error!");
            }
        }

        public void switchTab(object sender, RoutedEventArgs? e)
        {
            if (cbAutoWindowSwitch.IsChecked == true || e != null)
            {
                if (sender == btnTimerTab)
                {
                    Tabs.SelectedIndex = 1;
                    btnLeaderboardTab.Background = Brushes.LightGray;
                    btnTimerTab.Background = Brushes.LightSalmon;
                    btnStandbyTab.Background = Brushes.LightGray;
                    txtCurrentView.Text = "Current View = 'Timer Tab'";
                }
                else if (sender == btnLeaderboardTab)
                {
                    Tabs.SelectedIndex = 0;
                    btnLeaderboardTab.Background = Brushes.LightSalmon;
                    btnTimerTab.Background = Brushes.LightGray;
                    btnStandbyTab.Background = Brushes.LightGray;
                    txtCurrentView.Text = "Current View = 'Leaderboard Tab'";
                }
                else if (sender == btnStandbyTab)
                {
                    Tabs.SelectedIndex = 2;
                    btnLeaderboardTab.Background = Brushes.LightGray;
                    btnTimerTab.Background = Brushes.LightGray;
                    btnStandbyTab.Background = Brushes.LightSalmon;
                    txtCurrentView.Text = "Current View = 'Standby Tab'";
                }
            }
        }
        

        public void btnUpdateLeaderboardDetails(object sender, RoutedEventArgs e)
        {
            editLeaderboardDetails(cobLeaderboardOptions.SelectedIndex, tbLeaderoardOptionsName.Text);
        }

        public void btnShowLeaderboardDetails(object sender, RoutedEventArgs e)
        {
            tbLeaderoardOptionsName.Text = leaderboardNames[cobLeaderboardOptions.SelectedIndex];
        }

        public void updateLeaderboardDetailsUI()
        {
            cobLeaderboardSelect.ItemsSource = emptyList;
            cobLeaderboardOptions.ItemsSource = emptyList;
            cobLeaderboardFilter.ItemsSource = emptyList;

            leaderboardNamesAll[0] = "All";
            for (int i = 0; i < leaderboardNames.Length; i++)
            {
                leaderboardNamesAll[i + 1] = leaderboardNames[i];
            }

            for (int i = 0; i< leaderboardNames.Length; i++)
            {
                leaderboardNamesNumbered[i] = leaderboardNames[i] + " ("+(i+1)+")";
            }

            cobLeaderboardSelect.ItemsSource = leaderboardNames;
            cobLeaderboardOptions.ItemsSource = leaderboardNamesNumbered;
            cobLeaderboardFilter.ItemsSource = leaderboardNamesAll;

            cobLeaderboardOptions.SelectedIndex = 0;
            cobLeaderboardFilter.SelectedIndex = 0;
        }

        public void editLeaderboardDetails(int Index, string Name)
        {
            leaderboardNames[Index] = Name;
            updateLeaderboardDetailsUI();
        }

        public void saveDataDecision(object? sender, RoutedEventArgs? e)
        {
            if (sender != null)
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "Text (*.txt)|*.txt"; // File tag shown | file extension
                if (saveFileDialog.ShowDialog() == true) // once selecte file
                {
                    currentSavePath = saveFileDialog.FileName;
                    saveData(saveFileDialog.FileName);
                }
            }
            else
            {
                if (currentSavePath != null)
                {
                    saveData(currentSavePath);
                }
                else
                {
                    MessageBox.Show("Currently no previuos save file is loaded or new one created. Changes will not be saved!", "WARNING!");
                }
            }
        }

        public void saveData(string saveFile)
        {
            string saveLb = string.Join(",", leaderboard.Select(x => x.Lb)); // take Lb's
            string saveName = String.Join(",", leaderboard.Select(x => x.Name)); // take Names'
            string saveSeconds = String.Join(",", leaderboard.Select(x => x.Seconds)); // take Seconds'

            string saveLength = leaderboard.Count.ToString(); // take list length to help unpack
            string saveData = saveLength + "," + saveLb + "," + saveName + "," + saveSeconds; // combine all string data
            File.WriteAllText(saveFile, saveData); // replace file or create new and save
        }

        public void loadData(object? sender, RoutedEventArgs? e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Text (*.txt)|*.txt"; // File tag shown | file extension
            if (openFileDialog.ShowDialog() == true) //once selected file
            {
                currentSavePath = openFileDialog.FileName;

                List<string> data = File.ReadAllText(openFileDialog.FileName).Split(",").ToList(); // convert save to list

                leaderboard.Clear();

                for (int x = 1; x <= int.Parse(data[0]); x++)
                {
                    AddToList(int.Parse(data[x]), data[x + int.Parse(data[0])], int.Parse(data[x + int.Parse(data[0])*2]));
                }
                ChangedLeaderboard();
            }
        }
    }
}
