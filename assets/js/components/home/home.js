import React from 'react';
import {withStyles} from "@material-ui/core/es/styles";
import {CssBaseline, Divider, Paper} from "@material-ui/core";
import Typography from "@material-ui/core/Typography";

const styles = theme =>({
  viewport: {
    backgroundColor: theme.palette.grey[700],
    color: theme.palette.common.white,
    marginBottom: theme.spacing(4),
    padding: theme.spacing(3),
  }
});

class Home extends React.Component {
  render = () => {
    const { classes } = this.props;
    return <div>
      <CssBaseline />
      <Paper className={classes.viewport}>
        <Typography component="h3" variant="h5" gutterBottom>Loading...</Typography>
      </Paper>
    </div>
  }
}

export default withStyles(styles)(Home);
