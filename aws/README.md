# AWS Client scripts

Generate Key for API in Console.

Setup config-file with `aws configure`

Use the `aws` command , e.g.
```bash
aws ec2 describe-instances
```


# Using the `aws`-command in crontab

Make sure the right credentials are used with AWS_CONFIG_FILE variable, than call aws
e.g.
```
15  18  *   *   * AWS_CONFIG_FILE="/root/.aws/config";/usr/bin/aws ec2 stop-instances --instance-ids i-cb95a123 i-b152ce3a > /dev/null
0   10  *   *   * AWS_CONFIG_FILE="/root/.aws/config";/usr/bin/aws ec2 start-instances  --instance-ids i-cb95a123 i-b152ce3a > /dev/null
```

