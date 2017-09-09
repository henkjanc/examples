# AWS Client scripts

Generate Key for API in Console.

Setup config-file with `aws configure`

Use aws, e.g.
`aws ec2 describe-instances`


# Using aws in crons

Make sure the right credentials are used with AWS_CONFIG_FILE variable:
e.g.
```
15  18  *   *   * AWS_CONFIG_FILE="/root/.aws/config";/usr/bin/aws ec2 stop-instances --instance-ids i-cb95a123 i-b152ce3a > /dev/null
0   10  *   *   * AWS_CONFIG_FILE="/root/.aws/config";/usr/bin/aws ec2 start-instances  --instance-ids i-cb95a123 i-b152ce3a > /dev/null
```

