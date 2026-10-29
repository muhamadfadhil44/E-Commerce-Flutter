
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  bool _showUnreadOnly = false;
  String _searchQuery = '';

  static const Color backgroundColor = Color(0xFFF5F6F8);
  static const Color primaryColor = Color(0xFF252525);
  static const Color secondaryTextColor = Color(0xFF777777);
  static const Color borderColor = Color(0xFFEEEEEE);

  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'John Doe',
      'lastmessage': 'Beli sekarang sebelum kehabisan!!',
      'time': '10:30 PM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=11',
      'isread': false,
    },
    {
      'name': 'Alex Wibisono',
      'lastmessage': 'Saya sangat merekomendasikan ini!',
      'time': '1:00 PM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=12',
      'isread': false,
    },
    {
      'name': 'Rakabuming',
      'lastmessage': 'Enak!!',
      'time': '12:32 AM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=13',
      'isread': true,
    },
    {
      'name': 'Sire Sirol',
      'lastmessage': 'I love this!',
      'time': '9:18 PM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=14',
      'isread': false,
    },
    {
      'name': 'Mark',
      'lastmessage': 'Ini sangat mantap!',
      'time': '6:05 AM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=15',
      'isread': false,
    },
    {
      'name': 'Edd Matt Tom',
      'lastmessage': 'Saya baru tau ini sangat bagus',
      'time': '3:53 PM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=16',
      'isread': true,
    },
    {
      'name': 'Ibu Sri',
      'lastmessage': 'Saya bakal beli di sini untuk seterusnya',
      'time': '9:35 PM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=47',
      'isread': false,
    },
  ];

  List<Map<String, dynamic>> get _visibleChats {
    return _chats.where((chat) {
      final name = (chat['name'] as String).toLowerCase();
      final message = (chat['lastmessage'] as String).toLowerCase();

      final matchesSearch =
          name.contains(_searchQuery.toLowerCase()) ||
          message.contains(_searchQuery.toLowerCase());

      final matchesUnread =
          !_showUnreadOnly || chat['isread'] == false;

      return matchesSearch && matchesUnread;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount =
        _chats.where((chat) => chat['isread'] == false).length;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 24,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.7,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: borderColor),
            ),
            child: IconButton(
              tooltip: 'Messages',
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: primaryColor,
                size: 21,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stay connected with your customers.',
                  style: TextStyle(
                    fontSize: 13,
                    color: secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 20),

                // Search field
                TextField(
                  onChanged: (value) {
                    setState(() => _searchQuery = value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search conversations...',
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFAAAAAA),
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: secondaryTextColor,
                      size: 21,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Filter chips
                Row(
                  children: [
                    _buildFilterChip(
                      label: 'All messages',
                      selected: !_showUnreadOnly,
                      onTap: () {
                        setState(() => _showUnreadOnly = false);
                      },
                    ),
                    const SizedBox(width: 10),
                    _buildFilterChip(
                      label: 'Unread ($unreadCount)',
                      selected: _showUnreadOnly,
                      onTap: () {
                        setState(() => _showUnreadOnly = true);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Chat list
          Expanded(
            child: _visibleChats.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 45,
                          color: Color(0xFFBBBBBB),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No conversations found',
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    itemCount: _visibleChats.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final chat = _visibleChats[index];
                      final isUnread = chat['isread'] == false;

                      return Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () async {
                            final result =
                                await Navigator.pushNamed(
                              context,
                              '/detail_chat',
                              arguments: {
                                'contactName': chat['name'] as String,
                              },
                            );

                            if (!mounted) return;

                            if (result == true) {
                              setState(() {
                                chat['isread'] = true;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(18),
                              border:
                                  Border.all(color: borderColor),
                            ),
                            child: Row(
                              children: [
                                // Avatar
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 27,
                                      backgroundColor:
                                          const Color(0xFFEAEAEA),
                                      child: ClipOval(
                                        child: Image.network(
                                          chat['avatarUrl'] as String,
                                          width: 54,
                                          height: 54,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            progress,
                                          ) {
                                            if (progress == null) {
                                              return child;
                                            }

                                            return const SizedBox(
                                              width: 54,
                                              height: 54,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            );
                                          },
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return const SizedBox(
                                              width: 54,
                                              height: 54,
                                              child: Icon(
                                                Icons.person_rounded,
                                                size: 30,
                                                color:
                                                    secondaryTextColor,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    if (isUnread)
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                                const SizedBox(width: 14),

                                // Name and last message
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (chat['name'] as String).trim(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: isUnread
                                              ? FontWeight.w700
                                              : FontWeight.w600,
                                          color: primaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        chat['lastmessage'] as String,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isUnread
                                              ? primaryColor
                                              : secondaryTextColor,
                                          fontWeight: isUnread
                                              ? FontWeight.w500
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 10),

                                // Time
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      chat['time'] as String,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: isUnread
                                            ? primaryColor
                                            : secondaryTextColor,
                                        fontWeight: isUnread
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(height: 9),
                                    if (isUnread)
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: const BoxDecoration(
                                          color: primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected ? primaryColor : borderColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
