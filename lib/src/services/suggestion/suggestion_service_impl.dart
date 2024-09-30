import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exceptions/repository_exception.dart';
import './suggestion_service.dart';

const _suggestionKey = 'suggestions';

class SuggestionServiceImpl implements SuggestionService {
  @override
  Future<List<String>?> getSuggestions() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(_suggestionKey)) {
        return prefs.getStringList(_suggestionKey);
      } else {
        return <String>[];
      }
    } catch (e, s) {
      log('Erro ao buscar sugestões', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar sugestões');
    }
  }

  @override
  Future<void> saveSuggestion(String suggestion) async {
    if (suggestion.trim().isNotEmpty) {
      try {
        final SharedPreferences sp = await SharedPreferences.getInstance();
        List<String>? suggestions = await getSuggestions();
        suggestions!.add(suggestion);
        sp.setStringList(
            _suggestionKey, (suggestions.toSet()).toList().reversed.toList());
      } catch (e, s) {
        log('Erro ao salvar sugestão', error: e, stackTrace: s);
        throw RepositoryException(message: 'Erro ao salvar sugestão');
      }
    }
  }

  @override
  Future<void> suggestionClean() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
    } catch (e, s) {
      log('Erro limpar sugestoes', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro limpar sugestoe');
    }
  }
}
