To generate keys class based on the json translation files, use the below command in the terminal

flutter pub run easy_localization:generate
--source-dir 'assets/translations'
--output-dir 'lib/core/presentation/localization'
--output-file 'locale_keys.dart'
--format keys

Change the --output-dir directory as needed.
