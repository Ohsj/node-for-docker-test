module.exports = {
    apps: [{
        name: 'docker-test',
        script: './src/app.js',
        instances: 2,
        exec_mode: 'cluster',
        wait_ready: true,
        listen_timeout: 50000
    }]
}