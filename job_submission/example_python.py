import argparse

def myfun(x,y):
    return x+y

if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-x",
        "--x_arg",
        required=True
    )
    parser.add_argument(
        "-y",
        "--y_arg",
        required=True
    )
    args = vars(parser.parse_args())

    # user_id = args['user_id']
    x = args["x_arg"]
    y = args["y_arg"]
    myfun(x=x, y=y)