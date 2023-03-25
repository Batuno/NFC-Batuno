import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  _launchURLfb() async {
    const url = 'https://www.facebook.com/battumur.alzahgui.5';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLig() async {
    const url = 'https://www.instagram.com/dprbatunoo/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLgh() async {
    const url = 'https://github.com/Batuno';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'About',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text('Name'),
                    trailing: Text(
                      'NFC Batuno',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text('Creator'),
                    trailing: Text(
                      'Batuno',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text('Inspired'),
                    trailing: Text(
                      'Okadan',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: size.height * 0.7,
                            width: size.width * 0.7,
                            child: Text(
                              "NFC(near-field communication) нь ойрын зайнд ямар нэгэн гуравдагч талын оролцоогүйгээр мэдээлэл дамжуулах технологи юм. Бид үүгээр дамжуулан төлбөр тооцоо, цоож онгойлгох, дуртай мэдээллээ бусдад түгээх зэрэг олон үйлдлийг хийдэг. 2 ангилал байдаг нь идэвхтэй болон идэвхгүй. Идэвхтэй нь эрчим хүч ашигладаг төхөөрөмжүүд буюу бидний гар утас, пос төхөөрөмж зэрэг юм. Харин идэвхгүй нь nfc tag болно. Маш энгийн бүтэцтэй ч хэрэглэгчээс хамааран маш олон боломжоор ашиглах боломжтой технологи учир хэрэглэгч чөлөөтэй сэтгээрэй. 😃",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      );
                    },
                    title: Text('What is NFC?'),
                    trailing: Text(
                      'Click to know',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(139, 17, 118, 242),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: _launchURLfb,
                    child: Image.asset(
                      "assets/images/facebook.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(154, 222, 11, 57),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: _launchURLig,
                    child: Image.asset(
                      "assets/images/instagram.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: _launchURLgh,
                    child: Image.asset(
                      "assets/images/github.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
