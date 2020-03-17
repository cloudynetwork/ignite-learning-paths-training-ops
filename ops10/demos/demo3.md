# OPS 10 Demo 3 Script - SLIs in Log Analytics

>**On Stage Demo Video:**<br/>
[Demo 3: SLIs in Log Analytics (1:33)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/video/Demo3-SLI.mp4)

[![](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/images/demo3.png)](https://globaleventcdn.blob.core.windows.net/assets/ops/ops10/video/Demo3-SLI.mp4)

## Background

* Note: This is the same script as found embedded in the [main](../scripts/main.md) file, just broken out for convenience.

## Before you Demo

1. Be sure to deploy the app and send traffic to it as per the [demo 1 script](demo1.md)

## Script

For this demo, tailwind traders app back into the picture. We’ll bring in all of that log analytics knowledge we now have and all of the SLI info and see how we actually measure one.

1. Resource Group -> tt-app-insights -> Logs (Analytics) (or have a tab open with query in it)

Here we are back in the query editor. Allow me to drop a pre-made query into this editor and we’ll examine it one line at a time.

{Paste in the following}

```
requests
| where timestamp > ago(5h)
| summarize succeed = count (success == true), failed = count (success == false), total = count() by bin(timestamp, 5m)
| extend SLI = succeed * 100.00 / total
| project SLI, timestamp
| render timechart
```

As before, we begin with the table we will be querying. Here you can see we are using our old friend, requests. The next line should also be familiar, we’re constraining the records we care about to those generated within the 5 hours.

Next, we are going to count of the number of successful requests, the number of failed requests and total number of requests. We will keep track of this information in 5 minute units for graphing, that’s where the bin() statement comes into play.

The next line computes the ratio of successful calls to total calls and multiples it by 100 to yield a percentage we can graph. The subsequent line tells KQL we should output this calculated SLI metric and timestamp for our graph.

If we run this query, here’s what we get… Congratulations you’ve now seen your first SLI with Azure Monitor. Let’s take this one step further

[Next Demo - Service Level Object Query using KQL in Log Analytics](demo4.md)
