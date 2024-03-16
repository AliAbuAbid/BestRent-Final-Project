// import 'package:derot/Home.dart';

// import '/flutter_flow/flutter_flow_button_tabbar.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// //import 'home_page_model.dart';
// //export 'home_page_model.dart';

// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({super.key});

//   @override
//   State<HomePageWidget> createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget>
//     with TickerProviderStateMixin {
//   late HomePageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePage());

//     _model.tabBarController = TabController(
//       vsync: this,
//       length: 2,
//       initialIndex: 0,
//     )..addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Container(
//               width: 430,
//               height: 400,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 4,
//                     color: Color(0x33000000),
//                     offset: Offset(0, 2),
//                   )
//                 ],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
//                             child: Text(
//                               'Notifications',
//                               // style: FlutterFlowTheme.of(context)
//                               //     .titleLarge
//                                   // .override(
//                                   //   fontFamily: 'Outfit',
//                                   //   color: Color(0xFF14181B),
//                                   //   fontSize: 22,
//                                   //   fontWeight: FontWeight.w500,
//                                   ),
//                             ),
//                         //  ),
//                           IconButton(
//                             //borderColor: Color(0xFFE0E3E7),
//                             //borderRadius: 12,
//                             //borderWidth: 1,
//                             //buttonSize: 44,
//                             icon: Icon(
//                               Icons.close_rounded,
//                               color: Color(0xFF14181B),
//                               size: 20,
//                             ),
//                             onPressed: () async {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment(-1, 0),
//                             child: ButtonBar(
//                              //// useToggleButtonStyle: false,
//                               //isScrollable: true,
//                              // labelStyle: FlutterFlowTheme.of(context)
//                                   // .bodyLarge
//                                   // .override(
//                                   //   fontFamily: 'Plus Jakarta Sans',
//                                   //   color: Color(0xFF14181B),
//                                   //   fontSize: 16,
//                                   //   fontWeight: FontWeight.w500,
//                                   // ),
//                            //   unselectedLabelStyle: TextStyle(),
//                               // labelColor: Color(0xFF14181B),
//                               // unselectedLabelColor: Color(0xFF57636C),
//                               // backgroundColor: Color(0x4C4B39EF),
//                               // unselectedBackgroundColor: Colors.white,
//                               // borderColor: Color(0xFF4B39EF),
//                               // unselectedBorderColor: Color(0xFFE0E3E7),
//                               // borderWidth: 2,
//                               // borderRadius: 12,
//                               // elevation: 0,
//                               // labelPadding:
//                                 //  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
//                               ////buttonMargin:
//                               //    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
//                               // tabs: [
//                               //   Tab(
//                               //     text: 'New',
//                               //   ),
//                               //   Tab(
//                               //     text: 'All',
//                               //   ),
//                               // ],
//                              // controller: _model.tabBarController,
//                              // onTap: (i) async {
//                                // [() async {}, () async {}][i]();
//                              // },
//                             ),
//                           ),
//                           Expanded(
//                             child: TabBarView(
//                               controller: _model.tabBarController,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(12),
//                                     bottomRight: Radius.circular(12),
//                                     topLeft: Radius.circular(0),
//                                     topRight: Radius.circular(0),
//                                   ),
//                                   child: Container(
//                                     width: 100,
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(12),
//                                         bottomRight: Radius.circular(12),
//                                         topLeft: Radius.circular(0),
//                                         topRight: Radius.circular(0),
//                                       ),
//                                     ),
//                                     child: ListView(
//                                       padding: EdgeInsets.zero,
//                                       scrollDirection: Axis.vertical,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFF4B39EF),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       border: Border.all(
//                                                         color:
//                                                             Color(0xFF4B39EF),
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style:// FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFF4B39EF),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       border: Border.all(
//                                                         color:
//                                                             Color(0xFF4B39EF),
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFF4B39EF),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(12),
//                                     bottomRight: Radius.circular(12),
//                                     topLeft: Radius.circular(0),
//                                     topRight: Radius.circular(0),
//                                   ),
//                                   child: Container(
//                                     width: 100,
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF1F4F8),
//                                       borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(12),
//                                         bottomRight: Radius.circular(12),
//                                         topLeft: Radius.circular(0),
//                                         topRight: Radius.circular(0),
//                                       ),
//                                     ),
//                                     child: ListView(
//                                       padding: EdgeInsets.zero,
//                                       scrollDirection: Axis.vertical,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFF4B39EF),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       border: Border.all(
//                                                         color:
//                                                             Color(0xFF4B39EF),
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFF4B39EF),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       border: Border.all(
//                                                         color:
//                                                             Color(0xFF4B39EF),
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xFFF1F4F8),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFFE0E3E7),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       border: Border.all(
//                                                         color:
//                                                             Color(0xFFE0E3E7),
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xFFF1F4F8),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFFE0E3E7),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       border: Border.all(
//                                                         color:
//                                                             Color(0xFFE0E3E7),
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 1),
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 60,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xFFF1F4F8),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 0,
//                                                   color: Color(0xFFE0E3E7),
//                                                   offset: Offset(0, 1),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   Container(
//                                                     width: 4,
//                                                     height: 44,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xFFE0E3E7),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   12, 0, 0, 0),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'New Product View',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyLarge
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Plus Jakarta Sans',
//                                                                   color: Color(
//                                                                       0xFF14181B),
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           4,
//                                                                           0,
//                                                                           0),
//                                                               child: Text(
//                                                                 'Sally Mandrus, viewed your product',
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Plus Jakarta Sans',
//                                                                       color: Color(
//                                                                           0xFF57636C),
//                                                                       fontSize:
//                                                                           14,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                     ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     '3m ago',
//                                                     textAlign: TextAlign.end,
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .labelSmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF57636C),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }