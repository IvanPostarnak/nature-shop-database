DROP TABLE IF EXISTS privacy_policy;

CREATE TABLE privacy_policy
(
	privacy_policy_id INTEGER GENERATED ALWAYS AS IDENTITY,
  introduction TEXT NOT NULL,
  personal_info_collection TEXT NOT NULL,
  personal_info_use TEXT NOT NULL,
  personal_info_disclosure TEXT NOT NULL,
  security_measures TEXT NOT NULL,
  cookies TEXT NOT NULL,
  children_privacy TEXT NOT NULL,
  changes_policy TEXT NOT NULL,
  contact_email TEXT NOT NULL,
  afterword TEXT,
  create_ts TIMESTAMP NOT NULL DEFAULT NOW(),
  
	CONSTRAINT pk_privacy_policy_privacy_policy_id PRIMARY KEY (privacy_policy_id)
);

INSERT INTO privacy_policy(introduction, personal_info_collection, personal_info_use, personal_info_disclosure, security_measures, cookies, children_privacy, changes_policy, contact_email, afterword)
     VALUES (
              'At Nature Shop, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and disclose the information you provide while using our website, natureshop.com. Please note that this policy is entirely fake and made up for testing purposes only.',
              'We may collect fake personal information such as your name, email address, phone number, and mailing address when you voluntarily provide it to us during the fake registration process or when making a fake purchase on our website.',
              'The fake personal information we collect may be used for various purposes, including but not limited to: 1) Sending fake promotional emails about our products and services. 2) Conducting fake market research and analysis to improve our offerings. 3) Processing fake orders and providing fake customer support. 4) Customizing your fake shopping experience and offering personalized recommendations.',
              'We may disclose your fake personal information to third parties in the following situations: 1) Fake service providers: We may share your information with fake third-party service providers who assist us in operating our website and delivering our fake services. 2) Legal requirements: We may disclose your information if required to do so by law or if we believe that such disclosure is necessary to protect our fake rights or comply with a legal process.',
              'While we take fake security measures to protect your fake personal information, please note that no method of transmission over the internet or electronic storage is 100% secure. We cannot guarantee the absolute security of your fake information.',
              'We may use fake cookies and other tracking technologies to enhance your fake experience on our website. These technologies allow us to fake track your activities and preferences, such as fake pages visited and fake products viewed, to provide you with relevant content and improve our services.',
              'Our fake website and services are not intended for children under the age of 13. We do not knowingly collect fake personal information from children. If you believe that we have fake information from a child, please contact us immediately.'
              'We may update our fake Privacy Policy from time to time. Any changes will be fake and made up. We encourage you to review this page periodically to stay informed about our fake practices.',
              'If you have any questions or concerns about our fake Privacy Policy, please contact us at privacy@natureshop.com.',
              'privacy@natureshop.com',
              'This Privacy Policy is entirely fake and made up for testing purposes only. It has no legal validity or applicability.'
            );

SELECT *
  FROM privacy_policy;