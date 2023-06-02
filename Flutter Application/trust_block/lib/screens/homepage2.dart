import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage2(),
  ));
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionButton(
              optionText: 'Assets',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssetsPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Blockchain Transactions',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlockchainTransactionsPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Verification Status',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerificationStatusPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Track Usage',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackUsagePage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Cast Ballot',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CastBallotPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Intellectual Property Portal',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IntellectualPropertyPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Manage Identity',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageIdentityPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Log out',
              onPressed: () {
                // Perform logout functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String optionText;
  final VoidCallback onPressed;

  OptionButton({required this.optionText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(optionText),
    );
  }
}

// Placeholder pages for each option

class AssetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets Page'),
      ),
      body: Center(
        child: Text('This is the Assets Page'),
      ),
    );
  }
}

class BlockchainTransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Block Chain Transactions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Recent Block Chain Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Voter Name: Dibye Bhardwaj',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 396AF12G32',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Transactions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Explanations',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('C81')),
                    DataCell(Text('Vote for Public Driving')),
                    DataCell(Text('3rd June')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('S78A')),
                    DataCell(Text('Copyright Registration')),
                    DataCell(Text('4th May')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intellectual Property Portal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'View Verification Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Voter Name: Divye Bhardwaj',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 396AF12G32',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Verification Status:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'IP ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('12A81')),
                    DataCell(Text('Active')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('S78A')),
                    DataCell(Text('Processed & Active')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrackUsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intellectual Property Portal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Track Usage of IP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Voter Name: Dibye Bhardwaj',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 396AF12G32',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Transactions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'IP ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'View',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Shares',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Licenses',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('12A81')),
                    DataCell(Text('Active')),
                    DataCell(Text('201')),
                    DataCell(Text('2')),
                    DataCell(Text('25')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('51S71A')),
                    DataCell(Text('Active')),
                    DataCell(Text('120689')),
                    DataCell(Text('4')),
                    DataCell(Text('23')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('F82')),
                    DataCell(Text('Expired')),
                    DataCell(Text('1254')),
                    DataCell(Text('56')),
                    DataCell(Text('34')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CastBallotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cast Ballot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Voting Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteAmendmentPage(),
                  ),
                );
              },
              child: Text('Vote Amendment'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VotePanchayatPage(),
                  ),
                );
              },
              child: Text('Vote Panchayat'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteInternationalPage(),
                  ),
                );
              },
              child: Text('Vote International'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteMLAPage(),
                  ),
                );
              },
              child: Text('Vote MLA'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteRajyaSabhaMemberPage(),
                  ),
                );
              },
              child: Text('Vote Rajya Sabha Member'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteLocalPage(),
                  ),
                );
              },
              child: Text('Vote Local'),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteAmendmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote Amendment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cast your vote for Amendment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Voter Name: Divye Bhardway',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 3F896G897A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Candidates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('John Does'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Stephen Dorling'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Anna Maria'),
              value: false,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteConfirmationPage(),
                  ),
                );
              },
              child: Text('Cast Vote'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Repeat the same structure for other vote pages: VotePanchayatPage, VoteInternationalPage, VoteMLAPage,
// VoteRajyaSabhaMemberPage, and VoteLocalPage

class VotePanchayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote Panchayat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cast your vote for Panchayat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Voter Name: Divye Bhardway',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 3F896G897A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Candidates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Candidate 1'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate 2'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate 3'),
              value: false,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteConfirmationPage(),
                  ),
                );
              },
              child: Text('Cast Vote'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteInternationalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote International'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cast your vote for International',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Voter Name: Divye Bhardway',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 3F896G897A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Candidates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Candidate A'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate B'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate C'),
              value: false,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteConfirmationPage(),
                  ),
                );
              },
              child: Text('Cast Vote'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteMLAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote MLA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cast your vote for MLA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Voter Name: Divye Bhardway',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 3F896G897A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Candidates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Candidate X'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate Y'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate Z'),
              value: false,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteConfirmationPage(),
                  ),
                );
              },
              child: Text('Cast Vote'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteRajyaSabhaMemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote Rajya Sabha Member'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cast your vote for Rajya Sabha Member',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Voter Name: Divye Bhardway',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 3F896G897A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Candidates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Candidate P'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate Q'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate R'),
              value: false,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteConfirmationPage(),
                  ),
                );
              },
              child: Text('Cast Vote'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteLocalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote Local'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cast your vote for Local',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Voter Name: Divye Bhardway',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Public Key: 3F896G897A',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Candidates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Candidate M'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate N'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Candidate O'),
              value: false,
              onChanged: (bool? value) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoteConfirmationPage(),
                  ),
                );
              },
              child: Text('Cast Vote'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vote Casted!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
              child: Text('Go Back to Options'),
            ),
          ],
        ),
      ),
    );
  }
}

class IntellectualPropertyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intellectual Property Portal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionButton(
              optionText: 'Register Copyright',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterCopyrightPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Register Trademark',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterTrademarkPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Register Trade Secret',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterTradeSecretPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'File Patent',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilePatentPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Renew IP',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RenewIPPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Track Usage',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackUsagePage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Verification Status',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerificationStatusPage()),
                );
              },
            ),
            OptionButton(
              optionText: 'Go back to Home Page',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterCopyrightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Copyright Page'),
      ),
      body: Center(
        child: Text('This is the Register Copyright Page'),
      ),
    );
  }
}

class RegisterTrademarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Trademark'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: Divye Bhardwaj',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Public Key: 3F6A9C1FD4D',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Explanation of the Trademark Request:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your explanation here',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement file upload functionality here
              },
              child: Text('Upload File'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement submit functionality here
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterTradeSecretPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Trade Secret Page'),
      ),
      body: Center(
        child: Text('This is the Register Trade Secret Page'),
      ),
    );
  }
}

class FilePatentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Patent Page'),
      ),
      body: Center(
        child: Text('This is the File Patent Page'),
      ),
    );
  }
}

class RenewIPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renew IP Page'),
      ),
      body: Center(
        child: Text('This is the Renew IP Page'),
      ),
    );
  }
}

class ManageIdentityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Identity Page'),
      ),
      body: Center(
        child: Text('This is the Manage Identity Page'),
      ),
    );
  }
}
