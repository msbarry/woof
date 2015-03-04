# woof

![](http://26.media.tumblr.com/tumblr_l5c2dv4Qkd1qaggjuo1_500.gif)

Make long running tasks more fun (mac only).

Have you ever kicked off a long running task and wanted to work on something
else or play ping pong until it finished? If so then woof is for you.

Woof is a collection of command line tools to send yourself notifications
when long running tasks complete.  If you plan to stay close by,
`music <long running task>` will play the Jeapordy theme song (provided
separately) until that comand finishes.  If you plan to venture further
away, `<long running task> && text success || text failure` will send
you a text message when that task completes.

## Getting Started

1. Install [terminal-notifier](https://github.com/alloy/terminal-notifier).
2. Install and configure [twurl](https://github.com/twitter/twurl).
3. Download background music to `~/waiting.mp3`.
4. Add configuration parameters to the top of `woof.bash` and add 
`source path/to/woof.bash` to your bash profile.

## Usage

Play music from `~/waiting.mp3` in the background:

```
music git status
```

Pop up a growl notification:

```
notify Your job just finished.
```

Send yourself a text message:

```
text Your job just finished.
```

Tweet

```
tweet My job just finished.
```

Send yourself a direct message on Twitter:

```
dm_me Your job just finished.
```

Send yourself an email:

```
email Your job just finished.
```

Text-to-speech (this is actually built-in for macs, but worth noting anyway):

```
say Your job just finished.
```

Send yourself an email, direct message, tweet, text, growl notification, and speak:

```
woof Your job just finished.
```

!!!

## Creator

**Mike Barry**

- <https://github.com/msbarry>
- <https://twitter.com/msb5014>

Special thanks to [@mediocrity](https://twitter.com/mediocrity) for help
getting the `music` command working.

## Contributing

Feel free to fork the repo and open a pull request. Some suggestions:

* More notification methods
* Testimonials for the readme
* Benchmarking results
* Unit tests

## License

MIT
