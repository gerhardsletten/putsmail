desc "This task is called by the Heroku scheduler add-on"

task :delete_empty_tests => :environment do
  # delete all 1.week old empty tests
  TestMail.where(
    '(body = "" OR body IS NULL OR body LIKE "%<li>Do not use JavaScript.</li>%") AND updated_at <= ?',
    1.week.ago.utc
  ).delete_all
end

