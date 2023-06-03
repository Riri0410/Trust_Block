import 'package:flutter/material.dart';
import 'package:trust_block/screens/loginPage.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

void main() {
  runApp(DashboardDemoTrial());
}

class DashboardDemoTrial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trust Block',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 28.0,
            ),
            onPressed: () {
              // TODO: Implement account page
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, User!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  DashboardOption(
                    optionName: 'Assets',
                    icon: Icons.account_balance_wallet,
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AssetsPage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Blockchain Transactions',
                    icon: Icons.swap_horiz,
                    color: Colors.pink,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlockchainTransactionsPage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Verification Status',
                    icon: Icons.verified_user,
                    color: Colors.amber,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationStatusPage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Track Usage',
                    icon: Icons.track_changes,
                    color: Colors.teal,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackUsagePage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Cast Ballot',
                    icon: Icons.how_to_vote,
                    color: Colors.deepOrange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CastBallotPage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Register as Election Candidate',
                    icon: Icons.how_to_vote,
                    color: Colors.indigo,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterCandidatePage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Intellectual Property Portal',
                    icon: Icons.business_center,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IntellectualPropertyPage()),
                      );
                    },
                  ),
                  DashboardOption(
                    optionName: 'Manage Identity',
                    icon: Icons.person,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageIdentityPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardOption extends StatelessWidget {
  final String optionName;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  DashboardOption({
    required this.optionName,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Text(
              optionName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeOption extends StatelessWidget {
  final String optionName;
  final IconData icon;
  final VoidCallback onPressed;

  HomeOption({
    required this.optionName,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              optionName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AssetsPage extends StatelessWidget {
  final List<PropertyAsset> propertyAssets = [
    PropertyAsset(
      type: 'House',
      coordinates: 'Click to view on Google Maps',
      purchaseValue: '4 ETH',
      inherited: false,
    ),
    PropertyAsset(
      type: 'Land',
      coordinates: 'Click to view on Google Maps',
      purchaseValue: '2 ETH',
      inherited: true,
    ),
    PropertyAsset(
      type: 'Apartment',
      coordinates: 'Click to view on Google Maps',
      purchaseValue: '3 ETH',
      inherited: false,
    ),
  ];

  final List<FiscalAsset> fiscalAssets = [
    FiscalAsset(
      walletType: 'Custodial',
      currency: 'ETH',
      defi: 'On Loan Converted',
      investmentType: 'Stocks',
    ),
    FiscalAsset(
      walletType: 'Non-Custodial',
      currency: 'BTC',
      defi: 'Airdropped',
      investmentType: 'Bonds',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Property Assets',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Coordinates')),
              DataColumn(label: Text('Purchase Value')),
              DataColumn(label: Text('Inherited')),
            ],
            rows: propertyAssets.map((asset) {
              return DataRow(cells: [
                DataCell(Text(asset.type)),
                DataCell(
                  InkWell(
                    child: Text(asset.coordinates),
                    onTap: () {
                      // Handle Google Maps integration here
                    },
                  ),
                ),
                DataCell(Text(asset.purchaseValue)),
                DataCell(Text(asset.inherited ? 'Yes' : 'No')),
              ]);
            }).toList(),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fiscal Assets',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Wallet Type')),
              DataColumn(label: Text('Currency')),
              DataColumn(label: Text('DeFi')),
              DataColumn(label: Text('Investment Type')),
            ],
            rows: fiscalAssets.map((asset) {
              return DataRow(cells: [
                DataCell(Text(asset.walletType)),
                DataCell(Text(asset.currency)),
                DataCell(Text(asset.defi)),
                DataCell(Text(asset.investmentType)),
              ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PropertyAsset {
  final String type;
  final String coordinates;
  final String purchaseValue;
  final bool inherited;

  PropertyAsset({
    required this.type,
    required this.coordinates,
    required this.purchaseValue,
    required this.inherited,
  });
}

class FiscalAsset {
  final String walletType;
  final String currency;
  final String defi;
  final String investmentType;

  FiscalAsset({
    required this.walletType,
    required this.currency,
    required this.defi,
    required this.investmentType,
  });
}

class AssetPage extends StatelessWidget {
  final List<PropertyAsset> propertyAssets = [
    PropertyAsset(
      type: 'House',
      coordinates: 'Click to view on Google Maps',
      purchaseValue: '4 ETH',
      inherited: false,
    ),
    PropertyAsset(
      type: 'Land',
      coordinates: 'Click to view on Google Maps',
      purchaseValue: '2 ETH',
      inherited: true,
    ),
    PropertyAsset(
      type: 'Apartment',
      coordinates: 'Click to view on Google Maps',
      purchaseValue: '3 ETH',
      inherited: false,
    ),
  ];

  final List<FiscalAsset> fiscalAssets = [
    FiscalAsset(
      walletType: 'Custodial',
      currency: 'ETH',
      defi: 'On Loan Converted',
      investmentType: 'Stocks',
    ),
    FiscalAsset(
      walletType: 'Non-Custodial',
      currency: 'BTC',
      defi: 'Airdropped',
      investmentType: 'Bonds',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Page'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Property Assets',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('Coordinates')),
                  DataColumn(label: Text('Purchase Value')),
                  DataColumn(label: Text('Inherited')),
                ],
                rows: propertyAssets.map((asset) {
                  return DataRow(cells: [
                    DataCell(Text(asset.type)),
                    DataCell(
                      InkWell(
                        child: Text(asset.coordinates),
                        onTap: () {
                          // Handle Google Maps integration here
                        },
                      ),
                    ),
                    DataCell(Text(asset.purchaseValue)),
                    DataCell(Text(asset.inherited ? 'Yes' : 'No')),
                  ]);
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Fiscal Assets',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Wallet Type')),
                  DataColumn(label: Text('Currency')),
                  DataColumn(label: Text('DeFi')),
                  DataColumn(label: Text('Investment Type')),
                ],
                rows: fiscalAssets.map((asset) {
                  return DataRow(cells: [
                    DataCell(Text(asset.walletType)),
                    DataCell(Text(asset.currency)),
                    DataCell(Text(asset.defi)),
                    DataCell(Text(asset.investmentType)),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class PropertyAsset {
  final String type;
  final String coordinates;
  final String purchaseValue;
  final bool inherited;

  PropertyAsset({
    required this.type,
    required this.coordinates,
    required this.purchaseValue,
    required this.inherited,
  });
}

class FiscalAsset {
  final String walletType;
  final String currency;
  final String defi;
  final String investmentType;

  FiscalAsset({
    required this.walletType,
    required this.currency,
    required this.defi,
    required this.investmentType,
  });
}
*/
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
            Text(
              'Royalty Earned: 45 ETH',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class RegisterCandidatePage extends StatefulWidget {
  @override
  _RegisterCandidatePageState createState() => _RegisterCandidatePageState();
}


class _RegisterCandidatePageState extends State<RegisterCandidatePage> {
  final TextEditingController _nameController = TextEditingController();
  String _candidateName = '';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register as Candidate'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To register, fill in these details:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _candidateName = _nameController.text;
                });
                print('Candidate Name: $_candidateName');
              },
              child: Text('Register'),
            ),
            SizedBox(height: 16),
            Text(
              'Entered Candidate Name: $_candidateName',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
class RegisterCandidatePage extends StatefulWidget {
  @override
  _RegisterCandidatePageState createState() => _RegisterCandidatePageState();
}

class _RegisterCandidatePageState extends State<RegisterCandidatePage> {
  final _textController = TextEditingController();

  Future<void> sendTransaction() async {
    final inputValue = _textController.text;

    if (inputValue.isEmpty) {
      return; // Skip transaction if input value is empty
    }
    final web3 = Web3Client(
        'https://near-mainnet.infura.io/v3/7457b33aec174799a8a0d6d65a4e7b4a',
        Client());
    final contractAddress =
        EthereumAddress.fromHex('0x2323F7BEc895F34DA9C023c2a90Fc6d0F1f04aBc');
    final contractABI = '''[
      {
        "inputs": [
          {"internalType": "string", "name": "_name", "type": "string"}
        ],
        "name": "setName",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "name",
        "outputs": [
          {"internalType": "string", "name": "", "type": "string"}
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ]'''; // Replace with the contract's ABI

    final contract = DeployedContract(
      ContractAbi.fromJson(contractABI,
          'registerCandidate'), // Replace 'ContractName' with the actual contract name
      contractAddress,
    );
    final credentials = await web3.credentialsFromPrivateKey(
        '018c0ff078deccedd2b7562e0dba8c33f15a047b5f236a9e1273d11e4846d242');
    final senderAddress = await credentials.extractAddress();

    final function = contract.function('setName');
    final data = function.encodeCall(<String>[inputValue]);

    final transaction = Transaction.callContract(
      contract: contract,
      function: function,
      parameters: <dynamic>[inputValue],
      from: senderAddress,
      maxGas: 10000, // Adjust gas limit as needed
    );

    final networkId = await web3.getNetworkId();
    print("Chain ID: $networkId");
    final signedTransaction = await web3.signTransaction(
      credentials,
      transaction, // Replace with the correct chain ID (e.g., 3 for Ropsten)
    );

    final result = await web3.sendRawTransaction(await signedTransaction);

// Handle transaction result
    print(result);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register as Candidate'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To register, fill in these details:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: sendTransaction,
              child: Text('Register'),
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
        title: Text('Home Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          HomeOption(
            optionName: 'Vote Amendment',
            icon: Icons.gavel,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VoteAmendmentPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Vote Panchayat',
            icon: Icons.home_work,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VotePanchayatPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Vote Local',
            icon: Icons.location_city,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VoteLocalPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Vote for Rajya Sabha Member',
            icon: Icons.group,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VoteRajyaSabhaMemberPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Vote Member of Legislative Assembly',
            icon: Icons.how_to_vote,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VoteMLAPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Vote International',
            icon: Icons.public,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VoteInternationalPage()),
              );
            },
          ),
        ],
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
        title: Text('Intellectual Property Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          HomeOption(
            optionName: 'Register Copyright',
            icon: Icons.library_books,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterCopyrightPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Register Trademark',
            icon: Icons.branding_watermark,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterTrademarkPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Register Trade Secret',
            icon: Icons.security,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterTradeSecretPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'File Patent',
            icon: Icons.assignment,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilePatentPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Renew IP',
            icon: Icons.refresh,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RenewIP()),
              );
            },
          ),
          HomeOption(
            optionName: 'Track Usage',
            icon: Icons.track_changes,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackUsagePage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Verification',
            icon: Icons.verified_user,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerificationStatusPage()),
              );
            },
          ),
          HomeOption(
            optionName: 'Go Back to Home',
            icon: Icons.home,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class RegisterCopyrightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Copyright'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Explanation of the Copyright Request',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement file upload functionality
              },
              child: Text('Upload File'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement submit functionality
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ],
        ),
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
        title: Text('Register TradeSecret'),
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
              'Explanation of the Trade Secret Request:',
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

class FilePatentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register your File Patent'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Explanation of the File Patent Request',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement file upload functionality
              },
              child: Text('Upload File'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement submit functionality
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

class RenewIP extends StatelessWidget {
  final List<IntellectualProperty> intellectualProperties = [
    IntellectualProperty(
      id: 'IP001',
      username: 'JohnDoe',
      publicKey: '12345',
      isActive: true,
    ),
    IntellectualProperty(
      id: 'IP002',
      username: 'JaneSmith',
      publicKey: '67890',
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intellectual Property Page'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Intellectual Properties',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('IP ID')),
                  DataColumn(label: Text('Username')),
                  DataColumn(label: Text('Public Key')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: intellectualProperties.map((property) {
                  return DataRow(cells: [
                    DataCell(Text(property.id)),
                    DataCell(Text(property.username)),
                    DataCell(Text(property.publicKey)),
                    DataCell(Text(property.isActive ? 'Active' : 'Expired')),
                    DataCell(
                      property.isActive
                          ? Text('---')
                          : ElevatedButton(
                              onPressed: () {
                                // Handle renew action here
                              },
                              child: Text('Renew'),
                            ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IntellectualProperty {
  final String id;
  final String username;
  final String publicKey;
  final bool isActive;

  IntellectualProperty({
    required this.id,
    required this.username,
    required this.publicKey,
    required this.isActive,
  });
}

class ManageIdentityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Identity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Manage your identity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Options'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Action'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Your Next kin is: Rishabh Prasad'),
                      ),
                    ),
                    TableCell(
                      child: TextButton(
                        onPressed: () {
                          // Perform the action when Edit button is pressed
                          // For example, navigate to a page for editing the public key
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNextKinPage(),
                            ),
                          );
                        },
                        child: Text('Edit'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Change your private key'),
                      ),
                    ),
                    TableCell(
                      child: TextButton(
                        onPressed: () {
                          // Perform the action when Edit button is pressed
                          // For example, navigate to a page for changing the private key
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePrivateKeyPage(),
                            ),
                          );
                        },
                        child: Text('Edit'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Update Biometrics (only for people who just turned 18)'),
                      ),
                    ),
                    TableCell(
                      child: TextButton(
                        onPressed: () {
                          // Perform the action when Edit button is pressed
                          // For example, navigate to a page for updating biometrics
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateBiometricsPage(),
                            ),
                          );
                        },
                        child: Text('Edit'),
                      ),
                    ),
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

// Example pages for editing actions

class EditNextKinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Next Kin'),
      ),
      body: Center(
        child: Text('Edit Next Kin Page'),
      ),
    );
  }
}

class ChangePrivateKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Private Key'),
      ),
      body: Center(
        child: Text('Change Private Key Page'),
      ),
    );
  }
}

class UpdateBiometricsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Biometrics'),
      ),
      body: Center(
        child: Text('Update Biometrics Page'),
      ),
    );
  }
}
