"""
Generic module
"""
import torch
import os
import csv
import getpass
from tqdm import tqdm
from torch import nn
import torch.nn.functional as F
from time import time
from datetime import datetime

from blip.models import ModelHandler
from blip.module.common import *
from blip.module.generic_module import GenericModule
from blip.losses import LossHandler
from blip.optimizers import Optimizer
from blip.metrics import MetricHandler
from blip.trainer import Trainer
from blip.utils.sampling import *
from blip.utils.grouping import *
from blip.utils.callbacks import CallbackHandler
from blip.utils.utils import get_files, save_model


class PionAnalysisModule(GenericModule):
    """
    """
    def __init__(self,
        name:   str,
        config: dict={},
        mode:   str='',
        meta:   dict={}
    ):
        self.name = name + "_ml_module"
        super(PionAnalysisModule, self).__init__(
            self.name, config, mode, meta
        )
    
    def parse_config(self):
        pass

    def run_module(self):
        dataset = self.meta['dataset']
        loader = self.meta['loader']

        training_loop = tqdm(
            enumerate(self.meta['loader'].train_loader, 0), 
            total=len(self.meta['loader'].train_loader), 
            leave=True,
            colour='green'
        )
        for ii, event in training_loop:
            print(event.pos)